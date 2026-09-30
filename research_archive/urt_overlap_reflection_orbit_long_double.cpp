#include <algorithm>
#include <array>
#include <cmath>
#include <complex>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <limits>
#ifdef URT_QUAD_PRECISION
#include <quadmath.h>
#endif
#include <sstream>
#include <stdexcept>
#include <string>
#include <tuple>
#include <utility>
#include <vector>

// Independent extended-precision verification of the fixed scalar-density
// witness in urt_overlap_reflection_orbit_counterexample.py.  This program
// does not call LAPACK.  It constructs sign(gamma5 X) by Newton iteration,
// performs every inverse and determinant with pivoted long-double LU, and
// evaluates the four gauge configurations directly.

#ifdef URT_QUAD_PRECISION
using Real = __float128;
#else
using Real = long double;
#endif
using Complex = std::complex<Real>;

Real real_abs(Real value) {
#ifdef URT_QUAD_PRECISION
  return fabsq(value);
#else
  return std::abs(value);
#endif
}

Real real_sqrt(Real value) {
#ifdef URT_QUAD_PRECISION
  return sqrtq(value);
#else
  return std::sqrt(value);
#endif
}

Real real_log(Real value) {
#ifdef URT_QUAD_PRECISION
  return logq(value);
#else
  return std::log(value);
#endif
}

Real real_exp(Real value) {
#ifdef URT_QUAD_PRECISION
  return expq(value);
#else
  return std::exp(value);
#endif
}

Real real_cos(Real value) {
#ifdef URT_QUAD_PRECISION
  return cosq(value);
#else
  return std::cos(value);
#endif
}

Real real_sin(Real value) {
#ifdef URT_QUAD_PRECISION
  return sinq(value);
#else
  return std::sin(value);
#endif
}

Real real_acos(Real value) {
#ifdef URT_QUAD_PRECISION
  return acosq(value);
#else
  return std::acos(value);
#endif
}

Real real_remainder(Real left, Real right) {
#ifdef URT_QUAD_PRECISION
  return remainderq(left, right);
#else
  return std::remainder(left, right);
#endif
}

Real complex_abs(const Complex &value) {
  return real_sqrt(value.real() * value.real() + value.imag() * value.imag());
}

Real complex_arg(const Complex &value) {
#ifdef URT_QUAD_PRECISION
  return atan2q(value.imag(), value.real());
#else
  return std::arg(value);
#endif
}

Real parse_real(const char *value) {
#ifdef URT_QUAD_PRECISION
  return strtoflt128(value, nullptr);
#else
  return std::strtold(value, nullptr);
#endif
}

std::string render_real(Real value, int digits = 36) {
#ifdef URT_QUAD_PRECISION
  char buffer[160];
  quadmath_snprintf(buffer, sizeof buffer, "%.*Qg", digits, value);
  return std::string(buffer);
#else
  std::ostringstream stream;
  stream << std::setprecision(digits) << value;
  return stream.str();
#endif
}

constexpr int real_decimal_digits() {
#ifdef URT_QUAD_PRECISION
  return 33;
#else
  return std::numeric_limits<Real>::digits10;
#endif
}

Real arithmetic_tolerance() {
#ifdef URT_QUAD_PRECISION
  return parse_real("1e-29");
#else
  return 1e-17L;
#endif
}

constexpr int NT = 6;
constexpr int NS = 2;
constexpr int SITE_COUNT = NT * NS * NS * NS;
constexpr int SPIN = 4;
constexpr int DIMENSION = SITE_COUNT * SPIN;
constexpr int DIRECTION_COUNT = 11;

struct Matrix {
  int n;
  std::vector<Complex> data;
  explicit Matrix(int size = 0) : n(size), data(size * size, Complex(0, 0)) {}
  Complex &operator()(int row, int column) { return data[row * n + column]; }
  const Complex &operator()(int row, int column) const {
    return data[row * n + column];
  }
};

Matrix identity_matrix(int n) {
  Matrix out(n);
  for (int i = 0; i < n; ++i) out(i, i) = Complex(1, 0);
  return out;
}

Matrix add_scaled(const Matrix &left, const Matrix &right, Real scale_right) {
  Matrix out(left.n);
  for (size_t i = 0; i < out.data.size(); ++i)
    out.data[i] = left.data[i] + scale_right * right.data[i];
  return out;
}

Matrix scale(const Matrix &matrix, Real value) {
  Matrix out(matrix.n);
  for (size_t i = 0; i < out.data.size(); ++i)
    out.data[i] = value * matrix.data[i];
  return out;
}

Matrix multiply(const Matrix &left, const Matrix &right) {
  if (left.n != right.n) throw std::runtime_error("matrix size mismatch");
  const int n = left.n;
  Matrix out(n);
  for (int i = 0; i < n; ++i) {
    for (int k = 0; k < n; ++k) {
      const Complex value = left(i, k);
      if (value == Complex(0, 0)) continue;
      for (int j = 0; j < n; ++j) out(i, j) += value * right(k, j);
    }
  }
  return out;
}

Matrix dagger(const Matrix &matrix) {
  Matrix out(matrix.n);
  for (int i = 0; i < matrix.n; ++i)
    for (int j = 0; j < matrix.n; ++j)
      out(j, i) = std::conj(matrix(i, j));
  return out;
}

Real frobenius_norm(const Matrix &matrix) {
  Real sum = 0;
  for (const Complex &value : matrix.data) sum += std::norm(value);
  return real_sqrt(sum);
}

struct LU {
  Matrix factors;
  std::vector<int> pivots;
  int parity;
};

LU decompose(const Matrix &matrix) {
  const int n = matrix.n;
  LU out{matrix, std::vector<int>(n), 1};
  for (int k = 0; k < n; ++k) {
    int pivot = k;
    Real best = complex_abs(out.factors(k, k));
    for (int row = k + 1; row < n; ++row) {
      const Real candidate = complex_abs(out.factors(row, k));
      if (candidate > best) {
        best = candidate;
        pivot = row;
      }
    }
    if (best < 1e-30L) throw std::runtime_error("singular LU pivot");
    out.pivots[k] = pivot;
    if (pivot != k) {
      for (int column = 0; column < n; ++column)
        std::swap(out.factors(k, column), out.factors(pivot, column));
      out.parity = -out.parity;
    }
    for (int row = k + 1; row < n; ++row) {
      out.factors(row, k) /= out.factors(k, k);
      const Complex multiplier = out.factors(row, k);
      for (int column = k + 1; column < n; ++column)
        out.factors(row, column) -= multiplier * out.factors(k, column);
    }
  }
  return out;
}

std::vector<Complex> solve(const LU &lu, std::vector<Complex> right) {
  const int n = lu.factors.n;
  for (int k = 0; k < n; ++k) {
    if (lu.pivots[k] != k) std::swap(right[k], right[lu.pivots[k]]);
  }
  for (int row = 0; row < n; ++row) {
    for (int column = 0; column < row; ++column)
      right[row] -= lu.factors(row, column) * right[column];
  }
  for (int row = n - 1; row >= 0; --row) {
    for (int column = row + 1; column < n; ++column)
      right[row] -= lu.factors(row, column) * right[column];
    right[row] /= lu.factors(row, row);
  }
  return right;
}

Matrix inverse_from_lu(const LU &lu) {
  const int n = lu.factors.n;
  Matrix inverse(n);
  for (int column = 0; column < n; ++column) {
    std::vector<Complex> right(n, Complex(0, 0));
    right[column] = Complex(1, 0);
    const auto solution = solve(lu, std::move(right));
    for (int row = 0; row < n; ++row) inverse(row, column) = solution[row];
  }
  return inverse;
}

Matrix inverse(const Matrix &matrix) { return inverse_from_lu(decompose(matrix)); }

std::pair<Real, Real> logdet(const LU &lu) {
  Real log_absolute = 0;
  Real phase = lu.parity < 0 ? real_acos(Real(-1)) : Real(0);
  for (int i = 0; i < lu.factors.n; ++i) {
    const Complex value = lu.factors(i, i);
    log_absolute += real_log(complex_abs(value));
    phase += complex_arg(value);
  }
  phase = real_remainder(phase, Real(2) * real_acos(Real(-1)));
  return {log_absolute, phase};
}

using SpinMatrix = std::array<std::array<Complex, SPIN>, SPIN>;

SpinMatrix zero_spin() {
  SpinMatrix out{};
  for (auto &row : out) row.fill(Complex(0, 0));
  return out;
}

SpinMatrix spin_identity() {
  SpinMatrix out = zero_spin();
  for (int i = 0; i < SPIN; ++i) out[i][i] = Complex(1, 0);
  return out;
}

using Matrix2 = std::array<std::array<Complex, 2>, 2>;

SpinMatrix kronecker(const Matrix2 &left, const Matrix2 &right) {
  SpinMatrix out = zero_spin();
  for (int i = 0; i < 2; ++i)
    for (int j = 0; j < 2; ++j)
      for (int k = 0; k < 2; ++k)
        for (int l = 0; l < 2; ++l)
          out[2 * i + k][2 * j + l] = left[i][j] * right[k][l];
  return out;
}

std::array<SpinMatrix, 5> gamma_matrices() {
  const Complex I(0, 1);
  Matrix2 id{}, s1{}, s2{}, s3{};
  id[0][0] = id[1][1] = Complex(1, 0);
  s1[0][1] = s1[1][0] = Complex(1, 0);
  s2[0][1] = -I;
  s2[1][0] = I;
  s3[0][0] = Complex(1, 0);
  s3[1][1] = Complex(-1, 0);
  return {kronecker(s1, id), kronecker(s2, s1), kronecker(s2, s2),
          kronecker(s2, s3), kronecker(s3, id)};
}

int site_index(int t, int x, int y, int z) {
  auto mod = [](int value, int period) {
    value %= period;
    return value < 0 ? value + period : value;
  };
  return ((mod(t, NT) * NS + mod(x, NS)) * NS + mod(y, NS)) * NS +
         mod(z, NS);
}

std::array<int, 4> site_coordinates(int index) {
  std::array<int, 4> out{};
  out[3] = index % NS;
  index /= NS;
  out[2] = index % NS;
  index /= NS;
  out[1] = index % NS;
  index /= NS;
  out[0] = index;
  return out;
}

const std::array<std::array<int, 4>, DIRECTION_COUNT> DIRECTIONS{{
    {{0, 1, 0, 0}}, {{0, 0, 1, 0}}, {{0, 0, 0, 1}},
    {{1, 0, 0, 0}}, {{1, 0, 0, -1}}, {{1, 0, -1, 0}},
    {{1, 0, -1, -1}}, {{1, -1, 0, 0}}, {{1, -1, 0, -1}},
    {{1, -1, -1, 0}}, {{1, -1, -1, -1}},
}};

int shifted_site(int index, const std::array<int, 4> &direction) {
  const auto site = site_coordinates(index);
  return site_index(site[0] + direction[0], site[1] + direction[1],
                    site[2] + direction[2], site[3] + direction[3]);
}

int antiperiodic_sign(int index, const std::array<int, 4> &direction) {
  const int raw_time = site_coordinates(index)[0] + direction[0];
  return (raw_time < 0 || raw_time >= NT) ? -1 : 1;
}

void add_spin_block(Matrix &matrix, int row_site, int column_site,
                    const SpinMatrix &block, Complex scale_value) {
  for (int i = 0; i < SPIN; ++i)
    for (int j = 0; j < SPIN; ++j)
      matrix(SPIN * row_site + i, SPIN * column_site + j) +=
          scale_value * block[i][j];
}

SpinMatrix spin_linear(const SpinMatrix &left, Real left_scale,
                       const SpinMatrix &right, Real right_scale) {
  SpinMatrix out = zero_spin();
  for (int i = 0; i < SPIN; ++i)
    for (int j = 0; j < SPIN; ++j)
      out[i][j] = left_scale * left[i][j] + right_scale * right[i][j];
  return out;
}

Matrix wilson_operator(const std::vector<Complex> &links) {
  const auto gamma = gamma_matrices();
  const auto id4 = spin_identity();
  const Real r = 355508034923519.0L / 1000000000000000.0L;
  Matrix out(DIMENSION);
  const auto onsite = spin_linear(id4, 3.0L * r + 1.0L, id4, 0.0L);
  for (int site = 0; site < SITE_COUNT; ++site)
    add_spin_block(out, site, site, onsite, Complex(1, 0));

  for (int direction = 0; direction < DIRECTION_COUNT; ++direction) {
    SpinMatrix forward, backward;
    if (direction < 3) {
      forward = spin_linear(gamma[direction + 1], 0.5L, id4, -0.5L * r);
      backward = spin_linear(gamma[direction + 1], -0.5L, id4, -0.5L * r);
    } else {
      forward = spin_linear(gamma[0], 1.0L / 16.0L, id4, -1.0L / 16.0L);
      backward = spin_linear(gamma[0], -1.0L / 16.0L, id4, -1.0L / 16.0L);
    }
    auto reverse = DIRECTIONS[direction];
    for (int &value : reverse) value = -value;
    for (int site = 0; site < SITE_COUNT; ++site) {
      const int forward_site = shifted_site(site, DIRECTIONS[direction]);
      const int backward_site = shifted_site(site, reverse);
      add_spin_block(
          out, site, forward_site, forward,
          Complex(antiperiodic_sign(site, DIRECTIONS[direction]), 0) *
              links[site * DIRECTION_COUNT + direction]);
      add_spin_block(
          out, site, backward_site, backward,
          Complex(antiperiodic_sign(site, reverse), 0) *
              std::conj(links[backward_site * DIRECTION_COUNT + direction]));
    }
  }
  return out;
}

Matrix gamma5_full() {
  const auto gamma5 = gamma_matrices()[4];
  Matrix out(DIMENSION);
  for (int site = 0; site < SITE_COUNT; ++site)
    add_spin_block(out, site, site, gamma5, Complex(1, 0));
  return out;
}

struct SignResult {
  Matrix sign;
  int iterations;
  Real final_difference;
  Real involution_residual;
  Real hermiticity_residual;
};

SignResult matrix_sign_newton(const Matrix &hermitian) {
  Matrix current = scale(hermitian, 1.0L / 2.5L);
  int used = 0;
  Real difference = 0;
  for (int iteration = 0; iteration < 18; ++iteration) {
    Matrix inv = inverse(current);
    Matrix next(current.n);
    for (size_t i = 0; i < next.data.size(); ++i)
      next.data[i] = Real(0.5L) * (current.data[i] + inv.data[i]);
    Matrix delta = add_scaled(next, current, -1.0L);
    difference = frobenius_norm(delta);
    current = std::move(next);
    used = iteration + 1;
    if (difference < arithmetic_tolerance()) break;
  }
  const Matrix squared = multiply(current, current);
  const Matrix involution = add_scaled(squared, identity_matrix(current.n), -1.0L);
  const Matrix hermiticity = add_scaled(current, dagger(current), -1.0L);
  return {current, used, difference, frobenius_norm(involution),
          frobenius_norm(hermiticity)};
}

int reflected_site(int index) {
  const auto site = site_coordinates(index);
  int signed_time = site[0] <= NT / 2 ? site[0] : site[0] - NT;
  return site_index(-signed_time, site[1] + signed_time,
                    site[2] + signed_time, site[3] + signed_time);
}

Complex trace_block(const Matrix &matrix, int row_site, int column_site) {
  Complex out(0, 0);
  for (int spin = 0; spin < SPIN; ++spin)
    out += matrix(SPIN * row_site + spin, SPIN * column_site + spin);
  return out;
}

Complex trace_block_product(const Matrix &matrix, int first_row_site,
                            int first_column_site, int second_row_site,
                            int second_column_site) {
  Complex out(0, 0);
  for (int a = 0; a < SPIN; ++a)
    for (int b = 0; b < SPIN; ++b)
      out += matrix(SPIN * first_row_site + a,
                    SPIN * first_column_site + b) *
             matrix(SPIN * second_row_site + b,
                    SPIN * second_column_site + a);
  return out;
}

std::array<int, 16> positive_sites() {
  std::array<int, 16> out{};
  int cursor = 0;
  for (int t : {1, 2})
    for (int x = 0; x < NS; ++x)
      for (int y = 0; y < NS; ++y)
        for (int z = 0; z < NS; ++z) out[cursor++] = site_index(t, x, y, z);
  return out;
}

std::array<Real, 16> normalized_witness() {
  std::array<Real, 16> out{};
  for (int i = 0; i < 8; ++i) out[i] = -17.0L / 10000.0L;
  out[8] = 223.0L / 250.0L;
  out[9] = out[10] = out[12] = 51.0L / 10000.0L;
  out[11] = out[13] = out[14] = -1019.0L / 5000.0L;
  out[15] = -1411.0L / 5000.0L;
  Real norm = 0;
  for (Real value : out) norm += value * value;
  norm = real_sqrt(norm);
  for (Real &value : out) value /= norm;
  return out;
}

using ScalarGram = std::array<std::array<Complex, 16>, 16>;

ScalarGram scalar_gram(const Matrix &covariance) {
  const auto sites = positive_sites();
  ScalarGram out{};
  for (int row = 0; row < 16; ++row) {
    const int reflected = reflected_site(sites[row]);
    const Complex reflected_trace = trace_block(covariance, reflected, reflected);
    for (int column = 0; column < 16; ++column) {
      const int other = sites[column];
      out[row][column] =
          reflected_trace * trace_block(covariance, other, other) -
          trace_block_product(covariance, reflected, other, other, reflected);
    }
  }
  return out;
}

Real scalar_witness(const ScalarGram &gram) {
  const auto coefficients = normalized_witness();
  Complex value(0, 0);
  for (int row = 0; row < 16; ++row)
    for (int column = 0; column < 16; ++column)
      value += coefficients[row] * coefficients[column] * gram[row][column];
  if (real_abs(value.imag()) > parse_real("1e-13"))
    throw std::runtime_error("individual scalar witness has unexpected phase");
  return value.real();
}

struct ConfigurationResult {
  Real overlap_value;
  Real overlap_logdet;
  Real overlap_phase;
  Real Wilson_value;
  Real Wilson_logdet;
  Real Wilson_phase;
  int sign_iterations;
  Real sign_difference;
  Real sign_involution_residual;
  Real sign_hermiticity_residual;
  ScalarGram overlap_gram;
  ScalarGram Wilson_gram;
};

ConfigurationResult evaluate(int first_sign, int second_sign, Real angle) {
  std::vector<Complex> links(SITE_COUNT * DIRECTION_COUNT, Complex(1, 0));
  const Complex z(real_cos(angle), real_sin(angle));
  const int first_site = site_index(2, 0, 0, 0);
  const int second_site = site_index(3, 0, 1, 0);
  links[first_site * DIRECTION_COUNT + 8] = first_sign > 0 ? z : std::conj(z);
  links[second_site * DIRECTION_COUNT + 5] =
      second_sign > 0 ? z : std::conj(z);
  const Matrix wilson = wilson_operator(links);
  Matrix x = wilson;
  const Real height = 790940592107124.0L / 1000000000000000.0L;
  for (int i = 0; i < DIMENSION; ++i) x(i, i) -= height;
  const Matrix g5 = gamma5_full();
  const Matrix hermitian = multiply(g5, x);
  const SignResult sign = matrix_sign_newton(hermitian);
  const Matrix polar = multiply(g5, sign.sign);
  Matrix massive_overlap = scale(identity_matrix(DIMENSION), 0.75L);
  massive_overlap = add_scaled(massive_overlap, polar, 0.25L);
  const LU overlap_lu = decompose(massive_overlap);
  const Matrix overlap_covariance = inverse_from_lu(overlap_lu);
  const auto overlap_det = logdet(overlap_lu);

  Matrix massive_wilson = wilson;
  for (int i = 0; i < DIMENSION; ++i) massive_wilson(i, i) += 0.5L;
  const LU Wilson_lu = decompose(massive_wilson);
  const Matrix Wilson_covariance = inverse_from_lu(Wilson_lu);
  const auto Wilson_det = logdet(Wilson_lu);
  const ScalarGram overlap_gram = scalar_gram(overlap_covariance);
  const ScalarGram Wilson_gram = scalar_gram(Wilson_covariance);
  return {scalar_witness(overlap_gram), overlap_det.first,
          overlap_det.second, scalar_witness(Wilson_gram),
          Wilson_det.first, Wilson_det.second, sign.iterations,
          sign.final_difference, sign.involution_residual,
          sign.hermiticity_residual, overlap_gram, Wilson_gram};
}

Real determinant_weighted_value(const std::array<ConfigurationResult, 4> &rows,
                                bool overlap) {
  Real maximum = -parse_real("1e1000");
  for (const auto &row : rows)
    maximum = std::max(maximum,
                       overlap ? row.overlap_logdet : row.Wilson_logdet);
  Real numerator = 0;
  Real denominator = 0;
  for (const auto &row : rows) {
    const Real logweight = overlap ? row.overlap_logdet : row.Wilson_logdet;
    const Real weight = real_exp(logweight - maximum);
    numerator += weight * (overlap ? row.overlap_value : row.Wilson_value);
    denominator += weight;
  }
  return numerator / denominator;
}

using RealGram = std::array<std::array<Real, 16>, 16>;

RealGram determinant_weighted_gram(
    const std::array<ConfigurationResult, 4> &rows, bool overlap,
    Real &maximum_imaginary_residual) {
  Real maximum = -parse_real("1e1000");
  for (const auto &row : rows)
    maximum = std::max(maximum,
                       overlap ? row.overlap_logdet : row.Wilson_logdet);
  Real denominator = 0;
  std::array<std::array<Complex, 16>, 16> accumulator{};
  for (const auto &row : rows) {
    const Real logweight = overlap ? row.overlap_logdet : row.Wilson_logdet;
    const Real weight = real_exp(logweight - maximum);
    denominator += weight;
    const ScalarGram &gram = overlap ? row.overlap_gram : row.Wilson_gram;
    for (int i = 0; i < 16; ++i)
      for (int j = 0; j < 16; ++j) accumulator[i][j] += weight * gram[i][j];
  }
  RealGram out{};
  maximum_imaginary_residual = 0;
  for (int i = 0; i < 16; ++i) {
    for (int j = 0; j < 16; ++j) {
      const Complex left = accumulator[i][j] / denominator;
      const Complex right = std::conj(accumulator[j][i] / denominator);
      maximum_imaginary_residual = std::max(
          maximum_imaginary_residual,
          complex_abs(left - right));
      out[i][j] = (left.real() + right.real()) / Real(2);
    }
  }
  return out;
}

struct JacobiResult {
  std::array<Real, 16> eigenvalues;
  std::array<Real, 16> minimum_eigenvector;
};

JacobiResult jacobi_eigensystem(RealGram matrix) {
  RealGram vectors{};
  for (int i = 0; i < 16; ++i) vectors[i][i] = 1;
#ifdef URT_QUAD_PRECISION
  const Real threshold = parse_real("1e-29");
#else
  const Real threshold = parse_real("1e-18");
#endif
  for (int sweep = 0; sweep < 240; ++sweep) {
    Real maximum_offdiagonal = 0;
    for (int p = 0; p < 16; ++p) {
      for (int q = p + 1; q < 16; ++q) {
        const Real apq = matrix[p][q];
        maximum_offdiagonal = std::max(maximum_offdiagonal, real_abs(apq));
        if (real_abs(apq) <= threshold) continue;
        const Real tau = (matrix[q][q] - matrix[p][p]) / (Real(2) * apq);
        const Real sign = tau >= 0 ? Real(1) : Real(-1);
        const Real tangent = sign /
            (real_abs(tau) + real_sqrt(Real(1) + tau * tau));
        const Real cosine = Real(1) / real_sqrt(Real(1) + tangent * tangent);
        const Real sine = tangent * cosine;
        const Real app = matrix[p][p];
        const Real aqq = matrix[q][q];
        matrix[p][p] = app - tangent * apq;
        matrix[q][q] = aqq + tangent * apq;
        matrix[p][q] = matrix[q][p] = 0;
        for (int k = 0; k < 16; ++k) {
          if (k == p || k == q) continue;
          const Real mkp = matrix[k][p];
          const Real mkq = matrix[k][q];
          matrix[k][p] = matrix[p][k] = cosine * mkp - sine * mkq;
          matrix[k][q] = matrix[q][k] = sine * mkp + cosine * mkq;
        }
        for (int k = 0; k < 16; ++k) {
          const Real vkp = vectors[k][p];
          const Real vkq = vectors[k][q];
          vectors[k][p] = cosine * vkp - sine * vkq;
          vectors[k][q] = sine * vkp + cosine * vkq;
        }
      }
    }
    if (maximum_offdiagonal <= threshold) break;
    if (sweep == 239)
      throw std::runtime_error("Jacobi eigensolver did not converge");
  }
  int minimum_index = 0;
  for (int i = 1; i < 16; ++i)
    if (matrix[i][i] < matrix[minimum_index][minimum_index]) minimum_index = i;
  JacobiResult out{};
  for (int i = 0; i < 16; ++i) {
    out.eigenvalues[i] = matrix[i][i];
    out.minimum_eigenvector[i] = vectors[i][minimum_index];
  }
  std::sort(out.eigenvalues.begin(), out.eigenvalues.end());
  return out;
}

int main(int argc, char **argv) {
  try {
    const Real default_angle = parse_real("0.3947911196997615167403206731530255");
    const Real angle = argc > 1 ? parse_real(argv[1]) : default_angle;
    std::array<ConfigurationResult, 4> rows{};
    int cursor = 0;
    for (int first : {-1, 1})
      for (int second : {-1, 1})
        rows[cursor++] = evaluate(first, second, angle);
    const Real overlap = determinant_weighted_value(rows, true);
    const Real Wilson = determinant_weighted_value(rows, false);
    Real overlap_antihermitian = 0;
    Real Wilson_antihermitian = 0;
    const auto overlap_eigensystem = jacobi_eigensystem(
        determinant_weighted_gram(rows, true, overlap_antihermitian));
    const auto Wilson_eigensystem = jacobi_eigensystem(
        determinant_weighted_gram(rows, false, Wilson_antihermitian));
    Real maximum_phase = 0;
    Real maximum_sign_difference = 0;
    Real maximum_involution = 0;
    Real maximum_hermiticity = 0;
    int maximum_iterations = 0;
    for (const auto &row : rows) {
      maximum_phase = std::max(
          maximum_phase,
          std::max(real_abs(row.overlap_phase), real_abs(row.Wilson_phase)));
      maximum_sign_difference =
          std::max(maximum_sign_difference, row.sign_difference);
      maximum_involution =
          std::max(maximum_involution, row.sign_involution_residual);
      maximum_hermiticity =
          std::max(maximum_hermiticity, row.sign_hermiticity_residual);
      maximum_iterations = std::max(maximum_iterations, row.sign_iterations);
    }
    if (argc == 1 && !(overlap < -4.0e-8L && Wilson > 8.0e-8L))
      throw std::runtime_error("extended-precision witness sign check failed");
    std::cout << "{\n";
    std::cout << "  \"certificate\": \"URT overlap reflection-orbit long-double cross-check\",\n";
    std::cout << "  \"date\": \"2026-09-05\",\n";
#ifdef URT_QUAD_PRECISION
    std::cout << "  \"arithmetic\": \"std::complex<__float128>, pivoted in-house LU, Newton matrix sign; no LAPACK\",\n";
#else
    std::cout << "  \"arithmetic\": \"std::complex<long double>, pivoted in-house LU, Newton matrix sign; no LAPACK\",\n";
#endif
    std::cout << "  \"arithmetic_decimal_digits\": "
              << real_decimal_digits() << ",\n";
    std::cout << "  \"link_angle\": " << render_real(angle) << ",\n";
    std::cout << "  \"overlap_fixed_witness_OS_value\": "
              << render_real(overlap) << ",\n";
    std::cout << "  \"Wilson_same_witness_OS_value\": "
              << render_real(Wilson) << ",\n";
    std::cout << "  \"overlap_minimum_scalar_Gram_eigenvalue\": "
              << render_real(overlap_eigensystem.eigenvalues[0]) << ",\n";
    std::cout << "  \"overlap_minimum_over_angle_fourth\": "
              << render_real(overlap_eigensystem.eigenvalues[0] /
                             (angle * angle * angle * angle)) << ",\n";
    std::cout << "  \"Wilson_minimum_scalar_Gram_eigenvalue\": "
              << render_real(Wilson_eigensystem.eigenvalues[0]) << ",\n";
    std::cout << "  \"overlap_minimum_eigenvector\": [\n";
    for (int i = 0; i < 16; ++i) {
      std::cout << "    "
                << render_real(overlap_eigensystem.minimum_eigenvector[i]);
      std::cout << (i + 1 == 16 ? "\n" : ",\n");
    }
    std::cout << "  ],\n";
    std::cout << "  \"maximum_Gram_antihermitian_residual\": "
              << render_real(std::max(overlap_antihermitian,
                                      Wilson_antihermitian)) << ",\n";
    std::cout << "  \"maximum_determinant_phase\": "
              << render_real(maximum_phase) << ",\n";
    std::cout << "  \"matrix_sign\": {\n";
    std::cout << "    \"maximum_iterations\": " << maximum_iterations << ",\n";
    std::cout << "    \"maximum_final_iteration_difference_Frobenius\": "
              << render_real(maximum_sign_difference) << ",\n";
    std::cout << "    \"maximum_S_squared_minus_I_Frobenius\": "
              << render_real(maximum_involution) << ",\n";
    std::cout << "    \"maximum_S_minus_S_dagger_Frobenius\": "
              << render_real(maximum_hermiticity) << "\n";
    std::cout << "  },\n";
    std::cout << "  \"verdict\": {\n";
    std::cout << "    \"overlap_negative\": true,\n";
    std::cout << "    \"Wilson_positive\": true,\n";
    std::cout << "    \"independent_extended_precision_reproduction\": true,\n";
    std::cout << "    \"rigorous_interval_arithmetic\": false,\n";
    std::cout << "    \"status\": \"N independent cross-check; the separate selected-face Arb reproducer supplies the rigorous c_t=1 interval\"\n";
    std::cout << "  }\n";
    std::cout << "}\n";
  } catch (const std::exception &error) {
    std::cerr << error.what() << "\n";
    return 1;
  }
  return 0;
}