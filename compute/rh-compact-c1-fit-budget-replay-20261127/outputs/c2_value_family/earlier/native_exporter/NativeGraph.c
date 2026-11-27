// Lean compiler output
// Module: NativeGraph
// Imports: public import Init public meta import Init public import Lean
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* lean_st_ref_take(lean_object*);
lean_object* l_Lean_NameHashSet_insert(lean_object*, lean_object*);
lean_object* lean_st_ref_put(lean_object*, lean_object*);
lean_object* lean_st_ref_swap(lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
lean_object* l_Array_append___redArg(lean_object*, lean_object*);
lean_object* l_Lean_Name_mkStr2(lean_object*, lean_object*);
lean_object* lean_array_push(lean_object*, lean_object*);
lean_object* l_Lean_Name_mkStr1(lean_object*);
uint8_t lean_usize_dec_eq(size_t, size_t);
lean_object* lean_array_uget_borrowed(lean_object*, size_t);
size_t lean_usize_add(size_t, size_t);
lean_object* lean_array_to_list(lean_object*);
lean_object* l_List_toString___at___00Lean_resolveUniqueNamespace___at___00Lean_Elab_OpenDecl_elabOpenDecl___at___00Lean_Elab_Command_elabOpen_spec__0_spec__4_spec__5(lean_object*);
lean_object* lean_string_append(lean_object*, lean_object*);
uint8_t lean_nat_dec_lt(lean_object*, lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
size_t lean_usize_of_nat(lean_object*);
uint8_t l_Std_DHashMap_Internal_Raw_u2080_contains___at___00Lean_NameHashSet_contains_spec__0___redArg(lean_object*, lean_object*);
lean_object* lean_array_get_size(lean_object*);
uint8_t l_Array_contains___at___00Lean_Linter_Coe_coeLinter_spec__4(lean_object*, lean_object*);
lean_object* lean_mk_empty_array_with_capacity(lean_object*);
lean_object* lean_mk_array(lean_object*, lean_object*);
lean_object* lean_st_mk_ref(lean_object*);
lean_object* l_Lean_ForEachExpr_visit___at___00__private_Lean_Linter_UnusedVariables_0__Lean_Linter_UnusedVariables_visitAssignments_visitExpr_spec__1(lean_object*, lean_object*, lean_object*);
lean_object* lean_st_ref_get(lean_object*);
size_t lean_array_size(lean_object*);
uint8_t lean_usize_dec_lt(size_t, size_t);
lean_object* l_Lean_Expr_getUsedConstants(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
lean_object* l_Nat_reprFast(lean_object*);
lean_object* lean_array_uget(lean_object*, size_t);
lean_object* lean_array_uset(lean_object*, size_t, lean_object*);
lean_object* l_Lean_Json_mkObj(lean_object*);
lean_object* l_Lean_PersistentHashMap_mkEmptyEntriesArray___redArg();
lean_object* lean_array_get_borrowed(lean_object*, lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
lean_object* lean_environment_find(lean_object*, lean_object*);
lean_object* l_Lean_Name_toStringWithToken___at___00Lean_Name_toString_spec__0(lean_object*, uint8_t);
lean_object* l_Lean_Json_compress(lean_object*);
lean_object* l_IO_FS_Handle_putStrLn(lean_object*, lean_object*);
lean_object* l_Lean_ConstantInfo_type(lean_object*);
lean_object* l_Lean_ConstantInfo_name(lean_object*);
lean_object* l_Lean_Environment_getModuleIdxFor_x3f(lean_object*, lean_object*);
lean_object* l_Lean_Environment_mainModule(lean_object*);
lean_object* l_Lean_Environment_allImportedModuleNames(lean_object*);
lean_object* lean_array_fget(lean_object*, lean_object*);
uint8_t l_Lean_ConstantInfo_isUnsafe(lean_object*);
uint8_t l_Lean_ConstantInfo_isPartial(lean_object*);
lean_object* l_Lean_ConstantInfo_value_x3f(lean_object*, uint8_t);
lean_object* lean_array_mk(lean_object*);
lean_object* l_String_splitOnAux(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l_List_foldl___at___00Lean_moduleNameOfFileName_spec__0(lean_object*, lean_object*);
uint8_t l_List_isEmpty___redArg(lean_object*);
lean_object* l_Lean_initSearchPath(lean_object*, lean_object*);
extern lean_object* l_Lean_Options_empty;
lean_object* l_Lean_importModules(lean_object*, lean_object*, uint32_t, lean_object*, uint8_t, uint8_t, uint8_t, lean_object*);
lean_object* l_Lean_Environment_setExporting(lean_object*, uint8_t);
lean_object* lean_elab_environment_to_kernel_env(lean_object*);
lean_object* lean_io_get_num_heartbeats();
extern lean_object* l___private_Lean_Util_CollectAxioms_0__Lean_instInhabitedExportedAxiomsState;
extern lean_object* l___private_Lean_Util_CollectAxioms_0__Lean_exportedAxiomsExt;
lean_object* l_Lean_PersistentEnvExtension_getState___redArg(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l___private_Lean_Util_CollectAxioms_0__Lean_ExportedAxiomsState_find_x3f___boxed(lean_object*, lean_object*, lean_object*);
lean_object* l___private_Lean_Util_CollectAxioms_0__Lean_CollectAxioms_collectAndGet___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
lean_object* l___private_Lean_Util_CollectAxioms_0__Lean_CollectAxioms_runM___redArg(lean_object*, lean_object*);
lean_object* l_Lean_MessageData_toString(lean_object*);
lean_object* l_Lean_InternalExceptionId_getName(lean_object*);
extern lean_object* l_Lean_inheritedTraceOptions;
extern lean_object* l_Lean_diagnostics;
uint8_t l_Lean_Option_get___at___00Lean_Elab_addMacroStack___at___00Lean_throwError___at___00Lean_throwErrorAt___at___00Lean_throwUnknownIdentifierAt___at___00Lean_throwUnknownConstantAt___at___00Lean_throwUnknownConstant___at___00Lean_getConstVal___at___00Lean_mkConstWithLevelParams___at___00Lean_Elab_addConstInfo___at___00Lean_Elab_PostprocessTraces_elabStoreTraceAs_spec__3_spec__5_spec__6_spec__9_spec__12_spec__14_spec__16_spec__18_spec__20_spec__21(lean_object*, lean_object*);
lean_object* l_Lean_Kernel_enableDiag(lean_object*, uint8_t);
uint8_t l_Lean_Kernel_isDiagnosticsEnabled(lean_object*);
lean_object* lean_io_prim_handle_mk(lean_object*, uint8_t);
lean_object* l_Lean_JsonNumber_fromNat(lean_object*);
lean_object* l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(lean_object*);
static const lean_array_object l_CathedralKernelGraph_nameId___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 246}, .m_size = 0, .m_capacity = 0, .m_data = {}};
static const lean_object* l_CathedralKernelGraph_nameId___closed__0 = (const lean_object*)&l_CathedralKernelGraph_nameId___closed__0_value;
static const lean_string_object l_CathedralKernelGraph_nameId___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "s"};
static const lean_object* l_CathedralKernelGraph_nameId___closed__1 = (const lean_object*)&l_CathedralKernelGraph_nameId___closed__1_value;
static const lean_ctor_object l_CathedralKernelGraph_nameId___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_nameId___closed__1_value)}};
static const lean_object* l_CathedralKernelGraph_nameId___closed__2 = (const lean_object*)&l_CathedralKernelGraph_nameId___closed__2_value;
static lean_once_cell_t l_CathedralKernelGraph_nameId___closed__3_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_CathedralKernelGraph_nameId___closed__3;
static const lean_string_object l_CathedralKernelGraph_nameId___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "n"};
static const lean_object* l_CathedralKernelGraph_nameId___closed__4 = (const lean_object*)&l_CathedralKernelGraph_nameId___closed__4_value;
static const lean_ctor_object l_CathedralKernelGraph_nameId___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_nameId___closed__4_value)}};
static const lean_object* l_CathedralKernelGraph_nameId___closed__5 = (const lean_object*)&l_CathedralKernelGraph_nameId___closed__5_value;
static lean_once_cell_t l_CathedralKernelGraph_nameId___closed__6_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_CathedralKernelGraph_nameId___closed__6;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_nameId(lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_jid(lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00CathedralKernelGraph_jnames_spec__0(size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00CathedralKernelGraph_jnames_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_jnames(lean_object*);
static const lean_array_object l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 246}, .m_size = 0, .m_capacity = 0, .m_data = {}};
static const lean_object* l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0 = (const lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0_value;
static const lean_ctor_object l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0_value),((lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0_value),LEAN_SCALAR_PTR_LITERAL(0, 0, 0, 0, 0, 0, 0, 0)}};
static const lean_object* l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__1 = (const lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__1_value;
LEAN_EXPORT const lean_object* l_CathedralKernelGraph_instInhabitedExprRefs_default = (const lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__1_value;
LEAN_EXPORT const lean_object* l_CathedralKernelGraph_instInhabitedExprRefs = (const lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__1_value;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs___lam__0(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs___lam__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT uint8_t l___private_Init_Data_Array_Basic_0__Array_anyMUnsafe_any___at___00CathedralKernelGraph_exprRefs_spec__5(lean_object*, lean_object*, lean_object*, lean_object*, size_t, size_t);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_anyMUnsafe_any___at___00CathedralKernelGraph_exprRefs_spec__5___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3(lean_object*, lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4(lean_object*, lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Std_DHashMap_Internal_AssocList_foldlM___at___00CathedralKernelGraph_exprRefs_spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l_CathedralKernelGraph_exprRefs___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 81, .m_capacity = 81, .m_length = 80, .m_data = "getUsedConstants disagrees with independent const/projection traversal; missing="};
static const lean_object* l_CathedralKernelGraph_exprRefs___closed__0 = (const lean_object*)&l_CathedralKernelGraph_exprRefs___closed__0_value;
static const lean_string_object l_CathedralKernelGraph_exprRefs___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "#"};
static const lean_object* l_CathedralKernelGraph_exprRefs___closed__1 = (const lean_object*)&l_CathedralKernelGraph_exprRefs___closed__1_value;
static const lean_string_object l_CathedralKernelGraph_exprRefs___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 9, .m_capacity = 9, .m_length = 8, .m_data = "; extra="};
static const lean_object* l_CathedralKernelGraph_exprRefs___closed__2 = (const lean_object*)&l_CathedralKernelGraph_exprRefs___closed__2_value;
static lean_once_cell_t l_CathedralKernelGraph_exprRefs___closed__3_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_CathedralKernelGraph_exprRefs___closed__3;
static lean_once_cell_t l_CathedralKernelGraph_exprRefs___closed__4_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l_CathedralKernelGraph_exprRefs___closed__4;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs(lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs___boxed(lean_object*, lean_object*);
static const lean_string_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "Char"};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__0 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__0_value;
static const lean_string_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "ofNat"};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__1 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__1_value;
static const lean_ctor_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__2_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__0_value),LEAN_SCALAR_PTR_LITERAL(18, 67, 155, 167, 151, 71, 146, 196)}};
static const lean_ctor_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__2_value_aux_0),((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__1_value),LEAN_SCALAR_PTR_LITERAL(27, 51, 10, 169, 25, 67, 44, 251)}};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__2 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__2_value;
static const lean_string_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "String"};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__3 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__3_value;
static const lean_string_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "ofList"};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__4 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__4_value;
static const lean_ctor_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__5_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__3_value),LEAN_SCALAR_PTR_LITERAL(6, 130, 56, 8, 41, 104, 134, 43)}};
static const lean_ctor_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__5_value_aux_0),((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__4_value),LEAN_SCALAR_PTR_LITERAL(118, 246, 177, 142, 179, 9, 199, 233)}};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__5 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__5_value;
static const lean_array_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*2, .m_other = 0, .m_tag = 246}, .m_size = 2, .m_capacity = 2, .m_data = {((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__2_value),((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__5_value)}};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__6 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__6_value;
static const lean_string_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 4, .m_capacity = 4, .m_length = 3, .m_data = "Nat"};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__7 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__7_value;
static const lean_ctor_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__7_value),LEAN_SCALAR_PTR_LITERAL(155, 221, 223, 104, 58, 13, 204, 158)}};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__8 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__8_value;
static const lean_array_object l_CathedralKernelGraph_ExprRefs_literalNames___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*1, .m_other = 0, .m_tag = 246}, .m_size = 1, .m_capacity = 1, .m_data = {((lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__8_value)}};
static const lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___closed__9 = (const lean_object*)&l_CathedralKernelGraph_ExprRefs_literalNames___closed__9_value;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_ExprRefs_literalNames(lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___boxed(lean_object*);
static const lean_string_object l_CathedralKernelGraph_kind___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "axiom"};
static const lean_object* l_CathedralKernelGraph_kind___closed__0 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__0_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 11, .m_capacity = 11, .m_length = 10, .m_data = "definition"};
static const lean_object* l_CathedralKernelGraph_kind___closed__1 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__1_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "theorem"};
static const lean_object* l_CathedralKernelGraph_kind___closed__2 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__2_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "opaque"};
static const lean_object* l_CathedralKernelGraph_kind___closed__3 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__3_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 9, .m_capacity = 9, .m_length = 8, .m_data = "quotient"};
static const lean_object* l_CathedralKernelGraph_kind___closed__4 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__4_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "inductive"};
static const lean_object* l_CathedralKernelGraph_kind___closed__5 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__5_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "constructor"};
static const lean_object* l_CathedralKernelGraph_kind___closed__6 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__6_value;
static const lean_string_object l_CathedralKernelGraph_kind___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 9, .m_capacity = 9, .m_length = 8, .m_data = "recursor"};
static const lean_object* l_CathedralKernelGraph_kind___closed__7 = (const lean_object*)&l_CathedralKernelGraph_kind___closed__7_value;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_kind(lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_kind___boxed(lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_moduleName(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_moduleName___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "constants"};
static const lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__0 = (const lean_object*)&l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__0_value;
static const lean_string_object l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "projections"};
static const lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__1 = (const lean_object*)&l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__1_value;
static const lean_string_object l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "nat_literal"};
static const lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__2 = (const lean_object*)&l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__2_value;
static const lean_string_object l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "str_literal"};
static const lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__3 = (const lean_object*)&l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__3_value;
static const lean_string_object l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 9, .m_capacity = 9, .m_length = 8, .m_data = "literals"};
static const lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__4 = (const lean_object*)&l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__4_value;
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___boxed(lean_object*, lean_object*, lean_object*);
static const lean_string_object l_CathedralKernelGraph_record___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 15, .m_capacity = 15, .m_length = 14, .m_data = "type_constants"};
static const lean_object* l_CathedralKernelGraph_record___closed__0 = (const lean_object*)&l_CathedralKernelGraph_record___closed__0_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 16, .m_capacity = 16, .m_length = 15, .m_data = "value_constants"};
static const lean_object* l_CathedralKernelGraph_record___closed__1 = (const lean_object*)&l_CathedralKernelGraph_record___closed__1_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 17, .m_capacity = 17, .m_length = 16, .m_data = "type_projections"};
static const lean_object* l_CathedralKernelGraph_record___closed__2 = (const lean_object*)&l_CathedralKernelGraph_record___closed__2_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 18, .m_capacity = 18, .m_length = 17, .m_data = "value_projections"};
static const lean_object* l_CathedralKernelGraph_record___closed__3 = (const lean_object*)&l_CathedralKernelGraph_record___closed__3_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 12, .m_data = "constructors"};
static const lean_object* l_CathedralKernelGraph_record___closed__4 = (const lean_object*)&l_CathedralKernelGraph_record___closed__4_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "group"};
static const lean_object* l_CathedralKernelGraph_record___closed__5 = (const lean_object*)&l_CathedralKernelGraph_record___closed__5_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "parent"};
static const lean_object* l_CathedralKernelGraph_record___closed__6 = (const lean_object*)&l_CathedralKernelGraph_record___closed__6_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 17, .m_capacity = 17, .m_length = 16, .m_data = "type_nat_literal"};
static const lean_object* l_CathedralKernelGraph_record___closed__7 = (const lean_object*)&l_CathedralKernelGraph_record___closed__7_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 17, .m_capacity = 17, .m_length = 16, .m_data = "type_str_literal"};
static const lean_object* l_CathedralKernelGraph_record___closed__8 = (const lean_object*)&l_CathedralKernelGraph_record___closed__8_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 18, .m_capacity = 18, .m_length = 17, .m_data = "value_nat_literal"};
static const lean_object* l_CathedralKernelGraph_record___closed__9 = (const lean_object*)&l_CathedralKernelGraph_record___closed__9_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 18, .m_capacity = 18, .m_length = 17, .m_data = "value_str_literal"};
static const lean_object* l_CathedralKernelGraph_record___closed__10 = (const lean_object*)&l_CathedralKernelGraph_record___closed__10_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 14, .m_capacity = 14, .m_length = 13, .m_data = "type_literals"};
static const lean_object* l_CathedralKernelGraph_record___closed__11 = (const lean_object*)&l_CathedralKernelGraph_record___closed__11_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__12_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 15, .m_capacity = 15, .m_length = 14, .m_data = "value_literals"};
static const lean_object* l_CathedralKernelGraph_record___closed__12 = (const lean_object*)&l_CathedralKernelGraph_record___closed__12_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__13_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 13, .m_capacity = 13, .m_length = 12, .m_data = "mutual_block"};
static const lean_object* l_CathedralKernelGraph_record___closed__13 = (const lean_object*)&l_CathedralKernelGraph_record___closed__13_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__14_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 17, .m_capacity = 17, .m_length = 16, .m_data = "quotient_package"};
static const lean_object* l_CathedralKernelGraph_record___closed__14 = (const lean_object*)&l_CathedralKernelGraph_record___closed__14_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__15_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "rules"};
static const lean_object* l_CathedralKernelGraph_record___closed__15 = (const lean_object*)&l_CathedralKernelGraph_record___closed__15_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__16_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "record"};
static const lean_object* l_CathedralKernelGraph_record___closed__16 = (const lean_object*)&l_CathedralKernelGraph_record___closed__16_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__17_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "node"};
static const lean_object* l_CathedralKernelGraph_record___closed__17 = (const lean_object*)&l_CathedralKernelGraph_record___closed__17_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__18_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__17_value)}};
static const lean_object* l_CathedralKernelGraph_record___closed__18 = (const lean_object*)&l_CathedralKernelGraph_record___closed__18_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__19_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__16_value),((lean_object*)&l_CathedralKernelGraph_record___closed__18_value)}};
static const lean_object* l_CathedralKernelGraph_record___closed__19 = (const lean_object*)&l_CathedralKernelGraph_record___closed__19_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__20_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 3, .m_capacity = 3, .m_length = 2, .m_data = "id"};
static const lean_object* l_CathedralKernelGraph_record___closed__20 = (const lean_object*)&l_CathedralKernelGraph_record___closed__20_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__21_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "display"};
static const lean_object* l_CathedralKernelGraph_record___closed__21 = (const lean_object*)&l_CathedralKernelGraph_record___closed__21_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__22_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "module"};
static const lean_object* l_CathedralKernelGraph_record___closed__22 = (const lean_object*)&l_CathedralKernelGraph_record___closed__22_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__23_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "kind"};
static const lean_object* l_CathedralKernelGraph_record___closed__23 = (const lean_object*)&l_CathedralKernelGraph_record___closed__23_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__24_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "unsafe"};
static const lean_object* l_CathedralKernelGraph_record___closed__24 = (const lean_object*)&l_CathedralKernelGraph_record___closed__24_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__25_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "partial"};
static const lean_object* l_CathedralKernelGraph_record___closed__25 = (const lean_object*)&l_CathedralKernelGraph_record___closed__25_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__26_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 10, .m_capacity = 10, .m_length = 9, .m_data = "has_value"};
static const lean_object* l_CathedralKernelGraph_record___closed__26 = (const lean_object*)&l_CathedralKernelGraph_record___closed__26_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__27_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 3, .m_capacity = 3, .m_length = 2, .m_data = "Eq"};
static const lean_object* l_CathedralKernelGraph_record___closed__27 = (const lean_object*)&l_CathedralKernelGraph_record___closed__27_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__28_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_record___closed__27_value),LEAN_SCALAR_PTR_LITERAL(143, 37, 101, 248, 9, 246, 191, 223)}};
static const lean_object* l_CathedralKernelGraph_record___closed__28 = (const lean_object*)&l_CathedralKernelGraph_record___closed__28_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__29_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "Quot"};
static const lean_object* l_CathedralKernelGraph_record___closed__29 = (const lean_object*)&l_CathedralKernelGraph_record___closed__29_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__30_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_record___closed__29_value),LEAN_SCALAR_PTR_LITERAL(91, 127, 250, 116, 111, 99, 160, 200)}};
static const lean_object* l_CathedralKernelGraph_record___closed__30 = (const lean_object*)&l_CathedralKernelGraph_record___closed__30_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__31_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 3, .m_capacity = 3, .m_length = 2, .m_data = "mk"};
static const lean_object* l_CathedralKernelGraph_record___closed__31 = (const lean_object*)&l_CathedralKernelGraph_record___closed__31_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__32_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_record___closed__29_value),LEAN_SCALAR_PTR_LITERAL(91, 127, 250, 116, 111, 99, 160, 200)}};
static const lean_ctor_object l_CathedralKernelGraph_record___closed__32_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__32_value_aux_0),((lean_object*)&l_CathedralKernelGraph_record___closed__31_value),LEAN_SCALAR_PTR_LITERAL(255, 113, 137, 82, 82, 132, 58, 248)}};
static const lean_object* l_CathedralKernelGraph_record___closed__32 = (const lean_object*)&l_CathedralKernelGraph_record___closed__32_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__33_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "lift"};
static const lean_object* l_CathedralKernelGraph_record___closed__33 = (const lean_object*)&l_CathedralKernelGraph_record___closed__33_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__34_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_record___closed__29_value),LEAN_SCALAR_PTR_LITERAL(91, 127, 250, 116, 111, 99, 160, 200)}};
static const lean_ctor_object l_CathedralKernelGraph_record___closed__34_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__34_value_aux_0),((lean_object*)&l_CathedralKernelGraph_record___closed__33_value),LEAN_SCALAR_PTR_LITERAL(91, 125, 38, 34, 222, 200, 201, 80)}};
static const lean_object* l_CathedralKernelGraph_record___closed__34 = (const lean_object*)&l_CathedralKernelGraph_record___closed__34_value;
static const lean_string_object l_CathedralKernelGraph_record___closed__35_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 4, .m_capacity = 4, .m_length = 3, .m_data = "ind"};
static const lean_object* l_CathedralKernelGraph_record___closed__35 = (const lean_object*)&l_CathedralKernelGraph_record___closed__35_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__36_value_aux_0 = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l_CathedralKernelGraph_record___closed__29_value),LEAN_SCALAR_PTR_LITERAL(91, 127, 250, 116, 111, 99, 160, 200)}};
static const lean_ctor_object l_CathedralKernelGraph_record___closed__36_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__36_value_aux_0),((lean_object*)&l_CathedralKernelGraph_record___closed__35_value),LEAN_SCALAR_PTR_LITERAL(150, 213, 121, 152, 109, 27, 137, 60)}};
static const lean_object* l_CathedralKernelGraph_record___closed__36 = (const lean_object*)&l_CathedralKernelGraph_record___closed__36_value;
static const lean_array_object l_CathedralKernelGraph_record___closed__37_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*5, .m_other = 0, .m_tag = 246}, .m_size = 5, .m_capacity = 5, .m_data = {((lean_object*)&l_CathedralKernelGraph_record___closed__28_value),((lean_object*)&l_CathedralKernelGraph_record___closed__30_value),((lean_object*)&l_CathedralKernelGraph_record___closed__32_value),((lean_object*)&l_CathedralKernelGraph_record___closed__34_value),((lean_object*)&l_CathedralKernelGraph_record___closed__36_value)}};
static const lean_object* l_CathedralKernelGraph_record___closed__37 = (const lean_object*)&l_CathedralKernelGraph_record___closed__37_value;
static const lean_ctor_object l_CathedralKernelGraph_record___closed__38_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0_value),((lean_object*)&l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0_value)}};
static const lean_object* l_CathedralKernelGraph_record___closed__38 = (const lean_object*)&l_CathedralKernelGraph_record___closed__38_value;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_record(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_record___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exportGraph_spec__0(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exportGraph_spec__0___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 8, .m_capacity = 8, .m_length = 7, .m_data = "missing"};
static const lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__0 = (const lean_object*)&l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__0_value;
static const lean_ctor_object l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__0_value)}};
static const lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__1 = (const lean_object*)&l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__1_value;
static const lean_ctor_object l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__16_value),((lean_object*)&l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__1_value)}};
static const lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__2 = (const lean_object*)&l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__2_value;
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "header"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__0 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__0_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__0_value)}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__1 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__1_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__16_value),((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__1_value)}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__2 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__2_value;
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "schema"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__3 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__3_value;
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 24, .m_capacity = 24, .m_length = 23, .m_data = "compact-kernel-union-v1"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__4 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__4_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__4_value)}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__5 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__5_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__3_value),((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__5_value)}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__6 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__6_value;
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "roots"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__7 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__7_value;
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__8_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 12, .m_capacity = 12, .m_length = 11, .m_data = "root_axioms"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__8 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__8_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__9_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)(((size_t)(0) << 1) | 1))}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__9 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__9_value;
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__10_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 7, .m_capacity = 7, .m_length = 6, .m_data = "footer"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__10 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__10_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__11_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 3}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__10_value)}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__11 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__11_value;
static const lean_ctor_object l_CathedralKernelGraph_exportGraph___closed__12_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l_CathedralKernelGraph_record___closed__16_value),((lean_object*)&l_CathedralKernelGraph_exportGraph___closed__11_value)}};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__12 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__12_value;
static const lean_string_object l_CathedralKernelGraph_exportGraph___closed__13_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "nodes"};
static const lean_object* l_CathedralKernelGraph_exportGraph___closed__13 = (const lean_object*)&l_CathedralKernelGraph_exportGraph___closed__13_value;
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exportGraph(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exportGraph___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1___redArg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1___redArg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 2, .m_capacity = 2, .m_length = 1, .m_data = "."};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___closed__0 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___closed__0_value;
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0(size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0(size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3(lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 46, .m_capacity = 46, .m_length = 45, .m_data = "Root theorem not present as checked theorem: "};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__0 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__0_value;
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 6, .m_capacity = 6, .m_length = 5, .m_data = "_uniq"};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__1 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__1_value;
static const lean_ctor_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 8, .m_other = 2, .m_tag = 1}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__1_value),LEAN_SCALAR_PTR_LITERAL(237, 141, 162, 170, 202, 74, 55, 55)}};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__2 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__2_value;
static const lean_ctor_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*2 + 0, .m_other = 2, .m_tag = 0}, .m_objs = {((lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__2_value),((lean_object*)(((size_t)(1) << 1) | 1))}};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__3 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__3_value;
static const lean_ctor_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*3 + 0, .m_other = 3, .m_tag = 0}, .m_objs = {((lean_object*)(((size_t)(0) << 1) | 1)),((lean_object*)(((size_t)(1) << 1) | 1)),((lean_object*)(((size_t)(0) << 1) | 1))}};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__4 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__4_value;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__5_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__5;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__7_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__7;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__8_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__8;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__10_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__10;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__11_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__11;
static const lean_array_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__12_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 246}, .m_size = 0, .m_capacity = 0, .m_data = {}};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__12 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__12_value;
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__13_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 5, .m_capacity = 5, .m_length = 4, .m_data = "root"};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__13 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__13_value;
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__14_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 20, .m_capacity = 20, .m_length = 19, .m_data = "lean_collect_axioms"};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__14 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__14_value;
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__15_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 20, .m_capacity = 20, .m_length = 19, .m_data = "internal exception "};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__15 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__15_value;
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__16_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 21, .m_capacity = 21, .m_length = 20, .m_data = "internal exception #"};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__16 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__16_value;
static const lean_string_object l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__17_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 11, .m_capacity = 11, .m_length = 10, .m_data = " (unknown)"};
static const lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__17 = (const lean_object*)&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__17_value;
static lean_once_cell_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__18_once = LEAN_ONCE_CELL_INITIALIZER;
static uint8_t l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__18;
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2(lean_object*, lean_object*, lean_object*, uint8_t, lean_object*, size_t, size_t, lean_object*);
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___boxed(lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*, lean_object*);
static const lean_string_object l_main___closed__0_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 50, .m_capacity = 50, .m_length = 49, .m_data = "usage: native_graph SYSROOT MODULE OUTPUT ROOT..."};
static const lean_object* l_main___closed__0 = (const lean_object*)&l_main___closed__0_value;
static const lean_ctor_object l_main___closed__1_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 18}, .m_objs = {((lean_object*)&l_main___closed__0_value)}};
static const lean_object* l_main___closed__1 = (const lean_object*)&l_main___closed__1_value;
static const lean_string_object l_main___closed__2_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 16, .m_capacity = 16, .m_length = 15, .m_data = "Duplicate roots"};
static const lean_object* l_main___closed__2 = (const lean_object*)&l_main___closed__2_value;
static const lean_ctor_object l_main___closed__3_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 18}, .m_objs = {((lean_object*)&l_main___closed__2_value)}};
static const lean_object* l_main___closed__3 = (const lean_object*)&l_main___closed__3_value;
static const lean_array_object l_main___closed__4_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_array_object) + sizeof(void*)*0, .m_other = 0, .m_tag = 246}, .m_size = 0, .m_capacity = 0, .m_data = {}};
static const lean_object* l_main___closed__4 = (const lean_object*)&l_main___closed__4_value;
static const lean_string_object l_main___closed__5_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 22, .m_capacity = 22, .m_length = 21, .m_data = "NATIVE_GRAPH_COMPLETE"};
static const lean_object* l_main___closed__5 = (const lean_object*)&l_main___closed__5_value;
static const lean_string_object l_main___closed__6_value = {.m_header = {.m_rc = 0, .m_cs_sz = 0, .m_other = 0, .m_tag = 249}, .m_size = 30, .m_capacity = 30, .m_length = 29, .m_data = "At least one root is required"};
static const lean_object* l_main___closed__6 = (const lean_object*)&l_main___closed__6_value;
static const lean_ctor_object l_main___closed__7_value = {.m_header = {.m_rc = 0, .m_cs_sz = sizeof(lean_ctor_object) + sizeof(void*)*1 + 0, .m_other = 1, .m_tag = 18}, .m_objs = {((lean_object*)&l_main___closed__6_value)}};
static const lean_object* l_main___closed__7 = (const lean_object*)&l_main___closed__7_value;
LEAN_EXPORT lean_object* l_main___boxed__const__1;
LEAN_EXPORT lean_object* _lean_main(lean_object*);
LEAN_EXPORT lean_object* l_main___boxed(lean_object*, lean_object*);
static lean_object* _init_l_CathedralKernelGraph_nameId___closed__3(void){
_start:
{
lean_object* v___x_6_; lean_object* v___x_7_; lean_object* v___x_8_; lean_object* v___x_9_; 
v___x_6_ = ((lean_object*)(l_CathedralKernelGraph_nameId___closed__2));
v___x_7_ = lean_unsigned_to_nat(2u);
v___x_8_ = lean_mk_empty_array_with_capacity(v___x_7_);
v___x_9_ = lean_array_push(v___x_8_, v___x_6_);
return v___x_9_;
}
}
static lean_object* _init_l_CathedralKernelGraph_nameId___closed__6(void){
_start:
{
lean_object* v___x_13_; lean_object* v___x_14_; lean_object* v___x_15_; lean_object* v___x_16_; 
v___x_13_ = ((lean_object*)(l_CathedralKernelGraph_nameId___closed__5));
v___x_14_ = lean_unsigned_to_nat(2u);
v___x_15_ = lean_mk_empty_array_with_capacity(v___x_14_);
v___x_16_ = lean_array_push(v___x_15_, v___x_13_);
return v___x_16_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_nameId(lean_object* v_x_17_){
_start:
{
switch(lean_obj_tag(v_x_17_))
{
case 0:
{
lean_object* v___x_18_; 
v___x_18_ = ((lean_object*)(l_CathedralKernelGraph_nameId___closed__0));
return v___x_18_;
}
case 1:
{
lean_object* v_pre_19_; lean_object* v_str_20_; lean_object* v___x_21_; lean_object* v___x_22_; lean_object* v___x_23_; lean_object* v___x_24_; lean_object* v___x_25_; lean_object* v___x_26_; 
v_pre_19_ = lean_ctor_get(v_x_17_, 0);
lean_inc(v_pre_19_);
v_str_20_ = lean_ctor_get(v_x_17_, 1);
lean_inc_ref(v_str_20_);
lean_dec_ref_known(v_x_17_, 2);
v___x_21_ = l_CathedralKernelGraph_nameId(v_pre_19_);
v___x_22_ = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(v___x_22_, 0, v_str_20_);
v___x_23_ = lean_obj_once(&l_CathedralKernelGraph_nameId___closed__3, &l_CathedralKernelGraph_nameId___closed__3_once, _init_l_CathedralKernelGraph_nameId___closed__3);
v___x_24_ = lean_array_push(v___x_23_, v___x_22_);
v___x_25_ = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(v___x_25_, 0, v___x_24_);
v___x_26_ = lean_array_push(v___x_21_, v___x_25_);
return v___x_26_;
}
default: 
{
lean_object* v_pre_27_; lean_object* v_i_28_; lean_object* v___x_29_; lean_object* v___x_30_; lean_object* v___x_31_; lean_object* v___x_32_; lean_object* v___x_33_; lean_object* v___x_34_; lean_object* v___x_35_; 
v_pre_27_ = lean_ctor_get(v_x_17_, 0);
lean_inc(v_pre_27_);
v_i_28_ = lean_ctor_get(v_x_17_, 1);
lean_inc(v_i_28_);
lean_dec_ref_known(v_x_17_, 2);
v___x_29_ = l_CathedralKernelGraph_nameId(v_pre_27_);
v___x_30_ = l_Nat_reprFast(v_i_28_);
v___x_31_ = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(v___x_31_, 0, v___x_30_);
v___x_32_ = lean_obj_once(&l_CathedralKernelGraph_nameId___closed__6, &l_CathedralKernelGraph_nameId___closed__6_once, _init_l_CathedralKernelGraph_nameId___closed__6);
v___x_33_ = lean_array_push(v___x_32_, v___x_31_);
v___x_34_ = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(v___x_34_, 0, v___x_33_);
v___x_35_ = lean_array_push(v___x_29_, v___x_34_);
return v___x_35_;
}
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_jid(lean_object* v_n_36_){
_start:
{
lean_object* v___x_37_; lean_object* v___x_38_; 
v___x_37_ = l_CathedralKernelGraph_nameId(v_n_36_);
v___x_38_ = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(v___x_38_, 0, v___x_37_);
return v___x_38_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00CathedralKernelGraph_jnames_spec__0(size_t v_sz_39_, size_t v_i_40_, lean_object* v_bs_41_){
_start:
{
uint8_t v___x_42_; 
v___x_42_ = lean_usize_dec_lt(v_i_40_, v_sz_39_);
if (v___x_42_ == 0)
{
return v_bs_41_;
}
else
{
lean_object* v_v_43_; lean_object* v___x_44_; lean_object* v_bs_x27_45_; lean_object* v___x_46_; size_t v___x_47_; size_t v___x_48_; lean_object* v___x_49_; 
v_v_43_ = lean_array_uget(v_bs_41_, v_i_40_);
v___x_44_ = lean_unsigned_to_nat(0u);
v_bs_x27_45_ = lean_array_uset(v_bs_41_, v_i_40_, v___x_44_);
v___x_46_ = l_CathedralKernelGraph_jid(v_v_43_);
v___x_47_ = ((size_t)1ULL);
v___x_48_ = lean_usize_add(v_i_40_, v___x_47_);
v___x_49_ = lean_array_uset(v_bs_x27_45_, v_i_40_, v___x_46_);
v_i_40_ = v___x_48_;
v_bs_41_ = v___x_49_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00CathedralKernelGraph_jnames_spec__0___boxed(lean_object* v_sz_51_, lean_object* v_i_52_, lean_object* v_bs_53_){
_start:
{
size_t v_sz_boxed_54_; size_t v_i_boxed_55_; lean_object* v_res_56_; 
v_sz_boxed_54_ = lean_unbox_usize(v_sz_51_);
lean_dec(v_sz_51_);
v_i_boxed_55_ = lean_unbox_usize(v_i_52_);
lean_dec(v_i_52_);
v_res_56_ = l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00CathedralKernelGraph_jnames_spec__0(v_sz_boxed_54_, v_i_boxed_55_, v_bs_53_);
return v_res_56_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_jnames(lean_object* v_xs_57_){
_start:
{
size_t v_sz_58_; size_t v___x_59_; lean_object* v___x_60_; lean_object* v___x_61_; 
v_sz_58_ = lean_array_size(v_xs_57_);
v___x_59_ = ((size_t)0ULL);
v___x_60_ = l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00CathedralKernelGraph_jnames_spec__0(v_sz_58_, v___x_59_, v_xs_57_);
v___x_61_ = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(v___x_61_, 0, v___x_60_);
return v___x_61_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs___lam__0(lean_object* v_val_69_, lean_object* v_val_70_, lean_object* v_val_71_, lean_object* v_val_72_, lean_object* v_e_73_){
_start:
{
switch(lean_obj_tag(v_e_73_))
{
case 4:
{
lean_object* v_declName_79_; lean_object* v___x_80_; lean_object* v___x_81_; lean_object* v___x_82_; 
v_declName_79_ = lean_ctor_get(v_e_73_, 0);
lean_inc(v_declName_79_);
lean_dec_ref_known(v_e_73_, 2);
v___x_80_ = lean_st_ref_take(v_val_69_);
v___x_81_ = l_Lean_NameHashSet_insert(v___x_80_, v_declName_79_);
v___x_82_ = lean_st_ref_put(v_val_69_, v___x_81_);
goto v___jp_75_;
}
case 11:
{
lean_object* v_typeName_83_; lean_object* v___x_84_; lean_object* v___x_85_; lean_object* v___x_86_; 
v_typeName_83_ = lean_ctor_get(v_e_73_, 0);
lean_inc(v_typeName_83_);
lean_dec_ref_known(v_e_73_, 3);
v___x_84_ = lean_st_ref_take(v_val_70_);
v___x_85_ = l_Lean_NameHashSet_insert(v___x_84_, v_typeName_83_);
v___x_86_ = lean_st_ref_put(v_val_70_, v___x_85_);
goto v___jp_75_;
}
case 9:
{
lean_object* v_a_87_; 
v_a_87_ = lean_ctor_get(v_e_73_, 0);
lean_inc_ref(v_a_87_);
lean_dec_ref_known(v_e_73_, 1);
if (lean_obj_tag(v_a_87_) == 0)
{
uint8_t v___x_88_; lean_object* v___x_89_; lean_object* v___x_90_; 
lean_dec_ref_known(v_a_87_, 1);
v___x_88_ = 1;
v___x_89_ = lean_box(v___x_88_);
v___x_90_ = lean_st_ref_swap(v_val_71_, v___x_89_);
lean_dec(v___x_90_);
goto v___jp_75_;
}
else
{
uint8_t v___x_91_; lean_object* v___x_92_; lean_object* v___x_93_; 
lean_dec_ref_known(v_a_87_, 1);
v___x_91_ = 1;
v___x_92_ = lean_box(v___x_91_);
v___x_93_ = lean_st_ref_swap(v_val_72_, v___x_92_);
lean_dec(v___x_93_);
goto v___jp_75_;
}
}
default: 
{
lean_dec_ref(v_e_73_);
goto v___jp_75_;
}
}
v___jp_75_:
{
uint8_t v___x_76_; lean_object* v___x_77_; lean_object* v___x_78_; 
v___x_76_ = 1;
v___x_77_ = lean_box(v___x_76_);
v___x_78_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_78_, 0, v___x_77_);
return v___x_78_;
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs___lam__0___boxed(lean_object* v_val_94_, lean_object* v_val_95_, lean_object* v_val_96_, lean_object* v_val_97_, lean_object* v_e_98_, lean_object* v___y_99_){
_start:
{
lean_object* v_res_100_; 
v_res_100_ = l_CathedralKernelGraph_exprRefs___lam__0(v_val_94_, v_val_95_, v_val_96_, v_val_97_, v_e_98_);
lean_dec(v_val_97_);
lean_dec(v_val_96_);
lean_dec(v_val_95_);
lean_dec(v_val_94_);
return v_res_100_;
}
}
LEAN_EXPORT uint8_t l___private_Init_Data_Array_Basic_0__Array_anyMUnsafe_any___at___00CathedralKernelGraph_exprRefs_spec__5(lean_object* v_a_101_, lean_object* v___x_102_, lean_object* v___x_103_, lean_object* v_as_104_, size_t v_i_105_, size_t v_stop_106_){
_start:
{
uint8_t v___x_111_; 
v___x_111_ = lean_usize_dec_eq(v_i_105_, v_stop_106_);
if (v___x_111_ == 0)
{
lean_object* v___x_112_; uint8_t v___x_113_; 
v___x_112_ = lean_array_uget_borrowed(v_as_104_, v_i_105_);
v___x_113_ = l_Std_DHashMap_Internal_Raw_u2080_contains___at___00Lean_NameHashSet_contains_spec__0___redArg(v_a_101_, v___x_112_);
if (v___x_113_ == 0)
{
uint8_t v___x_114_; 
v___x_114_ = lean_nat_dec_eq(v___x_102_, v___x_103_);
if (v___x_114_ == 0)
{
goto v___jp_107_;
}
else
{
return v___x_114_;
}
}
else
{
goto v___jp_107_;
}
}
else
{
uint8_t v___x_115_; 
v___x_115_ = 0;
return v___x_115_;
}
v___jp_107_:
{
size_t v___x_108_; size_t v___x_109_; 
v___x_108_ = ((size_t)1ULL);
v___x_109_ = lean_usize_add(v_i_105_, v___x_108_);
v_i_105_ = v___x_109_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_anyMUnsafe_any___at___00CathedralKernelGraph_exprRefs_spec__5___boxed(lean_object* v_a_116_, lean_object* v___x_117_, lean_object* v___x_118_, lean_object* v_as_119_, lean_object* v_i_120_, lean_object* v_stop_121_){
_start:
{
size_t v_i_boxed_122_; size_t v_stop_boxed_123_; uint8_t v_res_124_; lean_object* v_r_125_; 
v_i_boxed_122_ = lean_unbox_usize(v_i_120_);
lean_dec(v_i_120_);
v_stop_boxed_123_ = lean_unbox_usize(v_stop_121_);
lean_dec(v_stop_121_);
v_res_124_ = l___private_Init_Data_Array_Basic_0__Array_anyMUnsafe_any___at___00CathedralKernelGraph_exprRefs_spec__5(v_a_116_, v___x_117_, v___x_118_, v_as_119_, v_i_boxed_122_, v_stop_boxed_123_);
lean_dec_ref(v_as_119_);
lean_dec(v___x_118_);
lean_dec(v___x_117_);
lean_dec_ref(v_a_116_);
v_r_125_ = lean_box(v_res_124_);
return v_r_125_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3(lean_object* v_a_126_, lean_object* v_as_127_, size_t v_i_128_, size_t v_stop_129_, lean_object* v_b_130_){
_start:
{
lean_object* v___y_132_; uint8_t v___x_136_; 
v___x_136_ = lean_usize_dec_eq(v_i_128_, v_stop_129_);
if (v___x_136_ == 0)
{
lean_object* v___x_137_; uint8_t v___x_138_; 
v___x_137_ = lean_array_uget_borrowed(v_as_127_, v_i_128_);
v___x_138_ = l_Std_DHashMap_Internal_Raw_u2080_contains___at___00Lean_NameHashSet_contains_spec__0___redArg(v_a_126_, v___x_137_);
if (v___x_138_ == 0)
{
lean_object* v___x_139_; 
lean_inc(v___x_137_);
v___x_139_ = lean_array_push(v_b_130_, v___x_137_);
v___y_132_ = v___x_139_;
goto v___jp_131_;
}
else
{
v___y_132_ = v_b_130_;
goto v___jp_131_;
}
}
else
{
return v_b_130_;
}
v___jp_131_:
{
size_t v___x_133_; size_t v___x_134_; 
v___x_133_ = ((size_t)1ULL);
v___x_134_ = lean_usize_add(v_i_128_, v___x_133_);
v_i_128_ = v___x_134_;
v_b_130_ = v___y_132_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3___boxed(lean_object* v_a_140_, lean_object* v_as_141_, lean_object* v_i_142_, lean_object* v_stop_143_, lean_object* v_b_144_){
_start:
{
size_t v_i_boxed_145_; size_t v_stop_boxed_146_; lean_object* v_res_147_; 
v_i_boxed_145_ = lean_unbox_usize(v_i_142_);
lean_dec(v_i_142_);
v_stop_boxed_146_ = lean_unbox_usize(v_stop_143_);
lean_dec(v_stop_143_);
v_res_147_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3(v_a_140_, v_as_141_, v_i_boxed_145_, v_stop_boxed_146_, v_b_144_);
lean_dec_ref(v_as_141_);
lean_dec_ref(v_a_140_);
return v_res_147_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4(lean_object* v___x_148_, lean_object* v_as_149_, size_t v_i_150_, size_t v_stop_151_, lean_object* v_b_152_){
_start:
{
lean_object* v___y_154_; uint8_t v___x_158_; 
v___x_158_ = lean_usize_dec_eq(v_i_150_, v_stop_151_);
if (v___x_158_ == 0)
{
lean_object* v___x_159_; uint8_t v___x_160_; 
v___x_159_ = lean_array_uget_borrowed(v_as_149_, v_i_150_);
v___x_160_ = l_Array_contains___at___00Lean_Linter_Coe_coeLinter_spec__4(v___x_148_, v___x_159_);
if (v___x_160_ == 0)
{
lean_object* v___x_161_; 
lean_inc(v___x_159_);
v___x_161_ = lean_array_push(v_b_152_, v___x_159_);
v___y_154_ = v___x_161_;
goto v___jp_153_;
}
else
{
v___y_154_ = v_b_152_;
goto v___jp_153_;
}
}
else
{
return v_b_152_;
}
v___jp_153_:
{
size_t v___x_155_; size_t v___x_156_; 
v___x_155_ = ((size_t)1ULL);
v___x_156_ = lean_usize_add(v_i_150_, v___x_155_);
v_i_150_ = v___x_156_;
v_b_152_ = v___y_154_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4___boxed(lean_object* v___x_162_, lean_object* v_as_163_, lean_object* v_i_164_, lean_object* v_stop_165_, lean_object* v_b_166_){
_start:
{
size_t v_i_boxed_167_; size_t v_stop_boxed_168_; lean_object* v_res_169_; 
v_i_boxed_167_ = lean_unbox_usize(v_i_164_);
lean_dec(v_i_164_);
v_stop_boxed_168_ = lean_unbox_usize(v_stop_165_);
lean_dec(v_stop_165_);
v_res_169_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4(v___x_162_, v_as_163_, v_i_boxed_167_, v_stop_boxed_168_, v_b_166_);
lean_dec_ref(v_as_163_);
lean_dec_ref(v___x_162_);
return v_res_169_;
}
}
LEAN_EXPORT lean_object* l_Std_DHashMap_Internal_AssocList_foldlM___at___00CathedralKernelGraph_exprRefs_spec__1(lean_object* v_x_170_, lean_object* v_x_171_){
_start:
{
if (lean_obj_tag(v_x_171_) == 0)
{
return v_x_170_;
}
else
{
lean_object* v_key_172_; lean_object* v_tail_173_; lean_object* v___x_174_; 
v_key_172_ = lean_ctor_get(v_x_171_, 0);
lean_inc(v_key_172_);
v_tail_173_ = lean_ctor_get(v_x_171_, 2);
lean_inc(v_tail_173_);
lean_dec_ref_known(v_x_171_, 3);
v___x_174_ = lean_array_push(v_x_170_, v_key_172_);
v_x_170_ = v___x_174_;
v_x_171_ = v_tail_173_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2(lean_object* v_as_176_, size_t v_i_177_, size_t v_stop_178_, lean_object* v_b_179_){
_start:
{
uint8_t v___x_180_; 
v___x_180_ = lean_usize_dec_eq(v_i_177_, v_stop_178_);
if (v___x_180_ == 0)
{
lean_object* v___x_181_; lean_object* v___x_182_; size_t v___x_183_; size_t v___x_184_; 
v___x_181_ = lean_array_uget_borrowed(v_as_176_, v_i_177_);
lean_inc(v___x_181_);
v___x_182_ = l_Std_DHashMap_Internal_AssocList_foldlM___at___00CathedralKernelGraph_exprRefs_spec__1(v_b_179_, v___x_181_);
v___x_183_ = ((size_t)1ULL);
v___x_184_ = lean_usize_add(v_i_177_, v___x_183_);
v_i_177_ = v___x_184_;
v_b_179_ = v___x_182_;
goto _start;
}
else
{
return v_b_179_;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2___boxed(lean_object* v_as_186_, lean_object* v_i_187_, lean_object* v_stop_188_, lean_object* v_b_189_){
_start:
{
size_t v_i_boxed_190_; size_t v_stop_boxed_191_; lean_object* v_res_192_; 
v_i_boxed_190_ = lean_unbox_usize(v_i_187_);
lean_dec(v_i_187_);
v_stop_boxed_191_ = lean_unbox_usize(v_stop_188_);
lean_dec(v_stop_188_);
v_res_192_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2(v_as_186_, v_i_boxed_190_, v_stop_boxed_191_, v_b_189_);
lean_dec_ref(v_as_186_);
return v_res_192_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0(lean_object* v_as_193_, size_t v_sz_194_, size_t v_i_195_, lean_object* v_b_196_){
_start:
{
uint8_t v___x_198_; 
v___x_198_ = lean_usize_dec_lt(v_i_195_, v_sz_194_);
if (v___x_198_ == 0)
{
lean_object* v___x_199_; 
v___x_199_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_199_, 0, v_b_196_);
return v___x_199_;
}
else
{
lean_object* v_a_200_; lean_object* v___x_201_; size_t v___x_202_; size_t v___x_203_; 
v_a_200_ = lean_array_uget_borrowed(v_as_193_, v_i_195_);
lean_inc(v_a_200_);
v___x_201_ = l_Lean_NameHashSet_insert(v_b_196_, v_a_200_);
v___x_202_ = ((size_t)1ULL);
v___x_203_ = lean_usize_add(v_i_195_, v___x_202_);
v_i_195_ = v___x_203_;
v_b_196_ = v___x_201_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0___boxed(lean_object* v_as_205_, lean_object* v_sz_206_, lean_object* v_i_207_, lean_object* v_b_208_, lean_object* v___y_209_){
_start:
{
size_t v_sz_boxed_210_; size_t v_i_boxed_211_; lean_object* v_res_212_; 
v_sz_boxed_210_ = lean_unbox_usize(v_sz_206_);
lean_dec(v_sz_206_);
v_i_boxed_211_ = lean_unbox_usize(v_i_207_);
lean_dec(v_i_207_);
v_res_212_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0(v_as_205_, v_sz_boxed_210_, v_i_boxed_211_, v_b_208_);
lean_dec_ref(v_as_205_);
return v_res_212_;
}
}
static lean_object* _init_l_CathedralKernelGraph_exprRefs___closed__3(void){
_start:
{
lean_object* v___x_216_; lean_object* v___x_217_; lean_object* v___x_218_; 
v___x_216_ = lean_box(0);
v___x_217_ = lean_unsigned_to_nat(16u);
v___x_218_ = lean_mk_array(v___x_217_, v___x_216_);
return v___x_218_;
}
}
static lean_object* _init_l_CathedralKernelGraph_exprRefs___closed__4(void){
_start:
{
lean_object* v___x_219_; lean_object* v___x_220_; lean_object* v___x_221_; 
v___x_219_ = lean_obj_once(&l_CathedralKernelGraph_exprRefs___closed__3, &l_CathedralKernelGraph_exprRefs___closed__3_once, _init_l_CathedralKernelGraph_exprRefs___closed__3);
v___x_220_ = lean_unsigned_to_nat(0u);
v___x_221_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_221_, 0, v___x_220_);
lean_ctor_set(v___x_221_, 1, v___x_219_);
return v___x_221_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs(lean_object* v_e_222_){
_start:
{
lean_object* v___y_225_; lean_object* v___y_226_; lean_object* v___y_242_; uint8_t v___y_243_; uint8_t v___y_244_; lean_object* v___y_245_; lean_object* v___x_248_; size_t v___y_250_; lean_object* v___y_251_; lean_object* v___y_252_; lean_object* v___y_253_; lean_object* v___y_254_; size_t v___y_263_; lean_object* v___y_264_; lean_object* v___y_265_; lean_object* v___y_266_; lean_object* v___y_267_; size_t v___y_277_; lean_object* v___y_278_; lean_object* v___y_279_; lean_object* v___y_280_; lean_object* v___y_281_; lean_object* v___y_282_; lean_object* v___x_288_; lean_object* v___x_289_; lean_object* v___x_290_; uint8_t v___x_291_; lean_object* v___x_292_; lean_object* v___x_293_; lean_object* v___x_294_; lean_object* v___x_295_; lean_object* v___f_296_; lean_object* v___x_297_; lean_object* v___x_298_; 
v___x_248_ = lean_unsigned_to_nat(0u);
v___x_288_ = lean_obj_once(&l_CathedralKernelGraph_exprRefs___closed__4, &l_CathedralKernelGraph_exprRefs___closed__4_once, _init_l_CathedralKernelGraph_exprRefs___closed__4);
v___x_289_ = lean_st_mk_ref(v___x_288_);
v___x_290_ = lean_st_mk_ref(v___x_288_);
v___x_291_ = 0;
v___x_292_ = lean_box(v___x_291_);
v___x_293_ = lean_st_mk_ref(v___x_292_);
v___x_294_ = lean_box(v___x_291_);
v___x_295_ = lean_st_mk_ref(v___x_294_);
lean_inc(v___x_295_);
lean_inc(v___x_293_);
lean_inc(v___x_290_);
lean_inc(v___x_289_);
v___f_296_ = lean_alloc_closure((void*)(l_CathedralKernelGraph_exprRefs___lam__0___boxed), 6, 4);
lean_closure_set(v___f_296_, 0, v___x_289_);
lean_closure_set(v___f_296_, 1, v___x_290_);
lean_closure_set(v___f_296_, 2, v___x_293_);
lean_closure_set(v___f_296_, 3, v___x_295_);
v___x_297_ = lean_st_mk_ref(v___x_288_);
lean_inc_ref(v_e_222_);
v___x_298_ = l_Lean_ForEachExpr_visit___at___00__private_Lean_Linter_UnusedVariables_0__Lean_Linter_UnusedVariables_visitAssignments_visitExpr_spec__1(v___f_296_, v_e_222_, v___x_297_);
if (lean_obj_tag(v___x_298_) == 0)
{
lean_object* v___x_299_; lean_object* v___x_300_; size_t v___y_302_; lean_object* v___y_303_; lean_object* v___x_317_; lean_object* v___y_319_; lean_object* v_size_340_; lean_object* v_buckets_341_; lean_object* v___x_342_; lean_object* v___x_343_; uint8_t v___x_344_; 
lean_dec_ref_known(v___x_298_, 1);
v___x_299_ = lean_st_ref_get(v___x_297_);
lean_dec(v___x_297_);
lean_dec(v___x_299_);
v___x_300_ = lean_st_ref_get(v___x_289_);
lean_dec(v___x_289_);
v___x_317_ = lean_st_ref_get(v___x_290_);
lean_dec(v___x_290_);
v_size_340_ = lean_ctor_get(v___x_317_, 0);
lean_inc(v_size_340_);
v_buckets_341_ = lean_ctor_get(v___x_317_, 1);
lean_inc_ref(v_buckets_341_);
lean_dec(v___x_317_);
v___x_342_ = lean_mk_empty_array_with_capacity(v_size_340_);
lean_dec(v_size_340_);
v___x_343_ = lean_array_get_size(v_buckets_341_);
v___x_344_ = lean_nat_dec_lt(v___x_248_, v___x_343_);
if (v___x_344_ == 0)
{
lean_dec_ref(v_buckets_341_);
v___y_319_ = v___x_342_;
goto v___jp_318_;
}
else
{
size_t v___x_345_; size_t v___x_346_; lean_object* v___x_347_; 
v___x_345_ = ((size_t)0ULL);
v___x_346_ = lean_usize_of_nat(v___x_343_);
v___x_347_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2(v_buckets_341_, v___x_345_, v___x_346_, v___x_342_);
lean_dec_ref(v_buckets_341_);
v___y_319_ = v___x_347_;
goto v___jp_318_;
}
v___jp_301_:
{
lean_object* v___x_304_; lean_object* v___x_305_; lean_object* v_size_306_; lean_object* v_buckets_307_; lean_object* v___x_308_; lean_object* v___x_309_; uint8_t v___x_310_; 
v___x_304_ = lean_st_ref_get(v___x_293_);
lean_dec(v___x_293_);
v___x_305_ = lean_st_ref_get(v___x_295_);
lean_dec(v___x_295_);
v_size_306_ = lean_ctor_get(v___x_300_, 0);
lean_inc(v_size_306_);
v_buckets_307_ = lean_ctor_get(v___x_300_, 1);
lean_inc_ref(v_buckets_307_);
lean_dec(v___x_300_);
v___x_308_ = lean_mk_empty_array_with_capacity(v_size_306_);
lean_dec(v_size_306_);
v___x_309_ = lean_array_get_size(v_buckets_307_);
v___x_310_ = lean_nat_dec_lt(v___x_248_, v___x_309_);
if (v___x_310_ == 0)
{
uint8_t v___x_311_; uint8_t v___x_312_; 
lean_dec_ref(v_buckets_307_);
v___x_311_ = lean_unbox(v___x_305_);
lean_dec(v___x_305_);
v___x_312_ = lean_unbox(v___x_304_);
lean_dec(v___x_304_);
v___y_242_ = v___y_303_;
v___y_243_ = v___x_311_;
v___y_244_ = v___x_312_;
v___y_245_ = v___x_308_;
goto v___jp_241_;
}
else
{
size_t v___x_313_; lean_object* v___x_314_; uint8_t v___x_315_; uint8_t v___x_316_; 
v___x_313_ = lean_usize_of_nat(v___x_309_);
v___x_314_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2(v_buckets_307_, v___y_302_, v___x_313_, v___x_308_);
lean_dec_ref(v_buckets_307_);
v___x_315_ = lean_unbox(v___x_305_);
lean_dec(v___x_305_);
v___x_316_ = lean_unbox(v___x_304_);
lean_dec(v___x_304_);
v___y_242_ = v___y_303_;
v___y_243_ = v___x_315_;
v___y_244_ = v___x_316_;
v___y_245_ = v___x_314_;
goto v___jp_241_;
}
}
v___jp_318_:
{
size_t v_sz_320_; size_t v___x_321_; lean_object* v___x_322_; 
v_sz_320_ = lean_array_size(v___y_319_);
v___x_321_ = ((size_t)0ULL);
lean_inc(v___x_300_);
v___x_322_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0(v___y_319_, v_sz_320_, v___x_321_, v___x_300_);
if (lean_obj_tag(v___x_322_) == 0)
{
lean_object* v_a_323_; lean_object* v_size_324_; lean_object* v_buckets_325_; lean_object* v___x_326_; lean_object* v___x_327_; uint8_t v___x_328_; 
v_a_323_ = lean_ctor_get(v___x_322_, 0);
lean_inc(v_a_323_);
lean_dec_ref_known(v___x_322_, 1);
v_size_324_ = lean_ctor_get(v_a_323_, 0);
lean_inc(v_size_324_);
v_buckets_325_ = lean_ctor_get(v_a_323_, 1);
lean_inc_ref(v_buckets_325_);
v___x_326_ = l_Lean_Expr_getUsedConstants(v_e_222_);
v___x_327_ = lean_array_get_size(v___x_326_);
v___x_328_ = lean_nat_dec_eq(v_size_324_, v___x_327_);
if (v___x_328_ == 0)
{
lean_dec_ref(v___y_319_);
lean_dec(v___x_300_);
lean_dec(v___x_295_);
lean_dec(v___x_293_);
v___y_277_ = v___x_321_;
v___y_278_ = v_buckets_325_;
v___y_279_ = v___x_327_;
v___y_280_ = v___x_326_;
v___y_281_ = v_a_323_;
v___y_282_ = v_size_324_;
goto v___jp_276_;
}
else
{
uint8_t v___x_329_; 
v___x_329_ = lean_nat_dec_lt(v___x_248_, v___x_327_);
if (v___x_329_ == 0)
{
lean_dec_ref(v___x_326_);
lean_dec_ref(v_buckets_325_);
lean_dec(v_size_324_);
lean_dec(v_a_323_);
v___y_302_ = v___x_321_;
v___y_303_ = v___y_319_;
goto v___jp_301_;
}
else
{
if (v___x_329_ == 0)
{
lean_dec_ref(v___x_326_);
lean_dec_ref(v_buckets_325_);
lean_dec(v_size_324_);
lean_dec(v_a_323_);
v___y_302_ = v___x_321_;
v___y_303_ = v___y_319_;
goto v___jp_301_;
}
else
{
size_t v___x_330_; uint8_t v___x_331_; 
v___x_330_ = lean_usize_of_nat(v___x_327_);
v___x_331_ = l___private_Init_Data_Array_Basic_0__Array_anyMUnsafe_any___at___00CathedralKernelGraph_exprRefs_spec__5(v_a_323_, v_size_324_, v___x_327_, v___x_326_, v___x_321_, v___x_330_);
if (v___x_331_ == 0)
{
lean_dec_ref(v___x_326_);
lean_dec_ref(v_buckets_325_);
lean_dec(v_size_324_);
lean_dec(v_a_323_);
v___y_302_ = v___x_321_;
v___y_303_ = v___y_319_;
goto v___jp_301_;
}
else
{
lean_dec_ref(v___y_319_);
lean_dec(v___x_300_);
lean_dec(v___x_295_);
lean_dec(v___x_293_);
v___y_277_ = v___x_321_;
v___y_278_ = v_buckets_325_;
v___y_279_ = v___x_327_;
v___y_280_ = v___x_326_;
v___y_281_ = v_a_323_;
v___y_282_ = v_size_324_;
goto v___jp_276_;
}
}
}
}
}
else
{
lean_object* v_a_332_; lean_object* v___x_334_; uint8_t v_isShared_335_; uint8_t v_isSharedCheck_339_; 
lean_dec_ref(v___y_319_);
lean_dec(v___x_300_);
lean_dec(v___x_295_);
lean_dec(v___x_293_);
lean_dec_ref(v_e_222_);
v_a_332_ = lean_ctor_get(v___x_322_, 0);
v_isSharedCheck_339_ = !lean_is_exclusive(v___x_322_);
if (v_isSharedCheck_339_ == 0)
{
v___x_334_ = v___x_322_;
v_isShared_335_ = v_isSharedCheck_339_;
goto v_resetjp_333_;
}
else
{
lean_inc(v_a_332_);
lean_dec(v___x_322_);
v___x_334_ = lean_box(0);
v_isShared_335_ = v_isSharedCheck_339_;
goto v_resetjp_333_;
}
v_resetjp_333_:
{
lean_object* v___x_337_; 
if (v_isShared_335_ == 0)
{
v___x_337_ = v___x_334_;
goto v_reusejp_336_;
}
else
{
lean_object* v_reuseFailAlloc_338_; 
v_reuseFailAlloc_338_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_338_, 0, v_a_332_);
v___x_337_ = v_reuseFailAlloc_338_;
goto v_reusejp_336_;
}
v_reusejp_336_:
{
return v___x_337_;
}
}
}
}
}
else
{
lean_object* v_a_348_; lean_object* v___x_350_; uint8_t v_isShared_351_; uint8_t v_isSharedCheck_355_; 
lean_dec(v___x_297_);
lean_dec(v___x_295_);
lean_dec(v___x_293_);
lean_dec(v___x_290_);
lean_dec(v___x_289_);
lean_dec_ref(v_e_222_);
v_a_348_ = lean_ctor_get(v___x_298_, 0);
v_isSharedCheck_355_ = !lean_is_exclusive(v___x_298_);
if (v_isSharedCheck_355_ == 0)
{
v___x_350_ = v___x_298_;
v_isShared_351_ = v_isSharedCheck_355_;
goto v_resetjp_349_;
}
else
{
lean_inc(v_a_348_);
lean_dec(v___x_298_);
v___x_350_ = lean_box(0);
v_isShared_351_ = v_isSharedCheck_355_;
goto v_resetjp_349_;
}
v_resetjp_349_:
{
lean_object* v___x_353_; 
if (v_isShared_351_ == 0)
{
v___x_353_ = v___x_350_;
goto v_reusejp_352_;
}
else
{
lean_object* v_reuseFailAlloc_354_; 
v_reuseFailAlloc_354_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_354_, 0, v_a_348_);
v___x_353_ = v_reuseFailAlloc_354_;
goto v_reusejp_352_;
}
v_reusejp_352_:
{
return v___x_353_;
}
}
}
v___jp_224_:
{
lean_object* v___x_227_; lean_object* v___x_228_; lean_object* v___x_229_; lean_object* v___x_230_; lean_object* v___x_231_; lean_object* v___x_232_; lean_object* v___x_233_; lean_object* v___x_234_; lean_object* v___x_235_; lean_object* v___x_236_; lean_object* v___x_237_; lean_object* v___x_238_; lean_object* v___x_239_; lean_object* v___x_240_; 
v___x_227_ = ((lean_object*)(l_CathedralKernelGraph_exprRefs___closed__0));
v___x_228_ = ((lean_object*)(l_CathedralKernelGraph_exprRefs___closed__1));
v___x_229_ = lean_array_to_list(v___y_225_);
v___x_230_ = l_List_toString___at___00Lean_resolveUniqueNamespace___at___00Lean_Elab_OpenDecl_elabOpenDecl___at___00Lean_Elab_Command_elabOpen_spec__0_spec__4_spec__5(v___x_229_);
v___x_231_ = lean_string_append(v___x_228_, v___x_230_);
lean_dec_ref(v___x_230_);
v___x_232_ = lean_string_append(v___x_227_, v___x_231_);
lean_dec_ref(v___x_231_);
v___x_233_ = ((lean_object*)(l_CathedralKernelGraph_exprRefs___closed__2));
v___x_234_ = lean_string_append(v___x_232_, v___x_233_);
v___x_235_ = lean_array_to_list(v___y_226_);
v___x_236_ = l_List_toString___at___00Lean_resolveUniqueNamespace___at___00Lean_Elab_OpenDecl_elabOpenDecl___at___00Lean_Elab_Command_elabOpen_spec__0_spec__4_spec__5(v___x_235_);
v___x_237_ = lean_string_append(v___x_228_, v___x_236_);
lean_dec_ref(v___x_236_);
v___x_238_ = lean_string_append(v___x_234_, v___x_237_);
lean_dec_ref(v___x_237_);
v___x_239_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_239_, 0, v___x_238_);
v___x_240_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_240_, 0, v___x_239_);
return v___x_240_;
}
v___jp_241_:
{
lean_object* v___x_246_; lean_object* v___x_247_; 
v___x_246_ = lean_alloc_ctor(0, 2, 2);
lean_ctor_set(v___x_246_, 0, v___y_245_);
lean_ctor_set(v___x_246_, 1, v___y_242_);
lean_ctor_set_uint8(v___x_246_, sizeof(void*)*2, v___y_244_);
lean_ctor_set_uint8(v___x_246_, sizeof(void*)*2 + 1, v___y_243_);
v___x_247_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_247_, 0, v___x_246_);
return v___x_247_;
}
v___jp_249_:
{
lean_object* v___x_255_; uint8_t v___x_256_; 
v___x_255_ = ((lean_object*)(l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0));
v___x_256_ = lean_nat_dec_lt(v___x_248_, v___y_251_);
if (v___x_256_ == 0)
{
lean_dec_ref(v___y_253_);
lean_dec_ref(v___y_252_);
lean_dec(v___y_251_);
v___y_225_ = v___y_254_;
v___y_226_ = v___x_255_;
goto v___jp_224_;
}
else
{
uint8_t v___x_257_; 
v___x_257_ = lean_nat_dec_le(v___y_251_, v___y_251_);
if (v___x_257_ == 0)
{
if (v___x_256_ == 0)
{
lean_dec_ref(v___y_253_);
lean_dec_ref(v___y_252_);
lean_dec(v___y_251_);
v___y_225_ = v___y_254_;
v___y_226_ = v___x_255_;
goto v___jp_224_;
}
else
{
size_t v___x_258_; lean_object* v___x_259_; 
v___x_258_ = lean_usize_of_nat(v___y_251_);
lean_dec(v___y_251_);
v___x_259_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3(v___y_253_, v___y_252_, v___y_250_, v___x_258_, v___x_255_);
lean_dec_ref(v___y_252_);
lean_dec_ref(v___y_253_);
v___y_225_ = v___y_254_;
v___y_226_ = v___x_259_;
goto v___jp_224_;
}
}
else
{
size_t v___x_260_; lean_object* v___x_261_; 
v___x_260_ = lean_usize_of_nat(v___y_251_);
lean_dec(v___y_251_);
v___x_261_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__3(v___y_253_, v___y_252_, v___y_250_, v___x_260_, v___x_255_);
lean_dec_ref(v___y_252_);
lean_dec_ref(v___y_253_);
v___y_225_ = v___y_254_;
v___y_226_ = v___x_261_;
goto v___jp_224_;
}
}
}
v___jp_262_:
{
lean_object* v___x_268_; lean_object* v___x_269_; uint8_t v___x_270_; 
v___x_268_ = lean_array_get_size(v___y_267_);
v___x_269_ = ((lean_object*)(l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0));
v___x_270_ = lean_nat_dec_lt(v___x_248_, v___x_268_);
if (v___x_270_ == 0)
{
lean_dec_ref(v___y_267_);
v___y_250_ = v___y_263_;
v___y_251_ = v___y_264_;
v___y_252_ = v___y_265_;
v___y_253_ = v___y_266_;
v___y_254_ = v___x_269_;
goto v___jp_249_;
}
else
{
uint8_t v___x_271_; 
v___x_271_ = lean_nat_dec_le(v___x_268_, v___x_268_);
if (v___x_271_ == 0)
{
if (v___x_270_ == 0)
{
lean_dec_ref(v___y_267_);
v___y_250_ = v___y_263_;
v___y_251_ = v___y_264_;
v___y_252_ = v___y_265_;
v___y_253_ = v___y_266_;
v___y_254_ = v___x_269_;
goto v___jp_249_;
}
else
{
size_t v___x_272_; lean_object* v___x_273_; 
v___x_272_ = lean_usize_of_nat(v___x_268_);
v___x_273_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4(v___y_265_, v___y_267_, v___y_263_, v___x_272_, v___x_269_);
lean_dec_ref(v___y_267_);
v___y_250_ = v___y_263_;
v___y_251_ = v___y_264_;
v___y_252_ = v___y_265_;
v___y_253_ = v___y_266_;
v___y_254_ = v___x_273_;
goto v___jp_249_;
}
}
else
{
size_t v___x_274_; lean_object* v___x_275_; 
v___x_274_ = lean_usize_of_nat(v___x_268_);
v___x_275_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__4(v___y_265_, v___y_267_, v___y_263_, v___x_274_, v___x_269_);
lean_dec_ref(v___y_267_);
v___y_250_ = v___y_263_;
v___y_251_ = v___y_264_;
v___y_252_ = v___y_265_;
v___y_253_ = v___y_266_;
v___y_254_ = v___x_275_;
goto v___jp_249_;
}
}
}
v___jp_276_:
{
lean_object* v___x_283_; lean_object* v___x_284_; uint8_t v___x_285_; 
v___x_283_ = lean_mk_empty_array_with_capacity(v___y_282_);
lean_dec(v___y_282_);
v___x_284_ = lean_array_get_size(v___y_278_);
v___x_285_ = lean_nat_dec_lt(v___x_248_, v___x_284_);
if (v___x_285_ == 0)
{
lean_dec_ref(v___y_278_);
v___y_263_ = v___y_277_;
v___y_264_ = v___y_279_;
v___y_265_ = v___y_280_;
v___y_266_ = v___y_281_;
v___y_267_ = v___x_283_;
goto v___jp_262_;
}
else
{
size_t v___x_286_; lean_object* v___x_287_; 
v___x_286_ = lean_usize_of_nat(v___x_284_);
v___x_287_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00CathedralKernelGraph_exprRefs_spec__2(v___y_278_, v___y_277_, v___x_286_, v___x_283_);
lean_dec_ref(v___y_278_);
v___y_263_ = v___y_277_;
v___y_264_ = v___y_279_;
v___y_265_ = v___y_280_;
v___y_266_ = v___y_281_;
v___y_267_ = v___x_287_;
goto v___jp_262_;
}
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exprRefs___boxed(lean_object* v_e_356_, lean_object* v_a_357_){
_start:
{
lean_object* v_res_358_; 
v_res_358_ = l_CathedralKernelGraph_exprRefs(v_e_356_);
return v_res_358_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_ExprRefs_literalNames(lean_object* v_r_382_){
_start:
{
uint8_t v_hasNatLit_383_; uint8_t v_hasStrLit_384_; lean_object* v___y_386_; 
v_hasNatLit_383_ = lean_ctor_get_uint8(v_r_382_, sizeof(void*)*2);
v_hasStrLit_384_ = lean_ctor_get_uint8(v_r_382_, sizeof(void*)*2 + 1);
if (v_hasNatLit_383_ == 0)
{
lean_object* v___x_391_; 
v___x_391_ = ((lean_object*)(l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0));
v___y_386_ = v___x_391_;
goto v___jp_385_;
}
else
{
lean_object* v___x_392_; 
v___x_392_ = ((lean_object*)(l_CathedralKernelGraph_ExprRefs_literalNames___closed__9));
v___y_386_ = v___x_392_;
goto v___jp_385_;
}
v___jp_385_:
{
if (v_hasStrLit_384_ == 0)
{
lean_object* v___x_387_; lean_object* v___x_388_; 
v___x_387_ = ((lean_object*)(l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0));
lean_inc_ref(v___y_386_);
v___x_388_ = l_Array_append___redArg(v___y_386_, v___x_387_);
return v___x_388_;
}
else
{
lean_object* v___x_389_; lean_object* v___x_390_; 
v___x_389_ = ((lean_object*)(l_CathedralKernelGraph_ExprRefs_literalNames___closed__6));
lean_inc_ref(v___y_386_);
v___x_390_ = l_Array_append___redArg(v___y_386_, v___x_389_);
return v___x_390_;
}
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_ExprRefs_literalNames___boxed(lean_object* v_r_393_){
_start:
{
lean_object* v_res_394_; 
v_res_394_ = l_CathedralKernelGraph_ExprRefs_literalNames(v_r_393_);
lean_dec_ref(v_r_393_);
return v_res_394_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_kind(lean_object* v_x_403_){
_start:
{
switch(lean_obj_tag(v_x_403_))
{
case 0:
{
lean_object* v___x_404_; 
v___x_404_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__0));
return v___x_404_;
}
case 1:
{
lean_object* v___x_405_; 
v___x_405_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__1));
return v___x_405_;
}
case 2:
{
lean_object* v___x_406_; 
v___x_406_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__2));
return v___x_406_;
}
case 3:
{
lean_object* v___x_407_; 
v___x_407_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__3));
return v___x_407_;
}
case 4:
{
lean_object* v___x_408_; 
v___x_408_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__4));
return v___x_408_;
}
case 5:
{
lean_object* v___x_409_; 
v___x_409_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__5));
return v___x_409_;
}
case 6:
{
lean_object* v___x_410_; 
v___x_410_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__6));
return v___x_410_;
}
default: 
{
lean_object* v___x_411_; 
v___x_411_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__7));
return v___x_411_;
}
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_kind___boxed(lean_object* v_x_412_){
_start:
{
lean_object* v_res_413_; 
v_res_413_ = l_CathedralKernelGraph_kind(v_x_412_);
lean_dec_ref(v_x_412_);
return v_res_413_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_moduleName(lean_object* v_env_414_, lean_object* v_n_415_){
_start:
{
lean_object* v___x_416_; 
v___x_416_ = l_Lean_Environment_getModuleIdxFor_x3f(v_env_414_, v_n_415_);
if (lean_obj_tag(v___x_416_) == 0)
{
lean_object* v___x_417_; 
v___x_417_ = l_Lean_Environment_mainModule(v_env_414_);
return v___x_417_;
}
else
{
lean_object* v_val_418_; lean_object* v___x_419_; lean_object* v___x_420_; uint8_t v___x_421_; 
v_val_418_ = lean_ctor_get(v___x_416_, 0);
lean_inc(v_val_418_);
lean_dec_ref_known(v___x_416_, 1);
v___x_419_ = l_Lean_Environment_allImportedModuleNames(v_env_414_);
v___x_420_ = lean_array_get_size(v___x_419_);
v___x_421_ = lean_nat_dec_lt(v_val_418_, v___x_420_);
if (v___x_421_ == 0)
{
lean_object* v___x_422_; 
lean_dec_ref(v___x_419_);
lean_dec(v_val_418_);
v___x_422_ = lean_box(0);
return v___x_422_;
}
else
{
lean_object* v___x_423_; 
v___x_423_ = lean_array_fget(v___x_419_, v_val_418_);
lean_dec(v_val_418_);
lean_dec_ref(v___x_419_);
return v___x_423_;
}
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_moduleName___boxed(lean_object* v_env_424_, lean_object* v_n_425_){
_start:
{
lean_object* v_res_426_; 
v_res_426_ = l_CathedralKernelGraph_moduleName(v_env_424_, v_n_425_);
lean_dec(v_n_425_);
lean_dec_ref(v_env_424_);
return v_res_426_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0(lean_object* v_as_427_, size_t v_sz_428_, size_t v_i_429_, lean_object* v_b_430_){
_start:
{
uint8_t v___x_432_; 
v___x_432_ = lean_usize_dec_lt(v_i_429_, v_sz_428_);
if (v___x_432_ == 0)
{
lean_object* v___x_433_; 
v___x_433_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_433_, 0, v_b_430_);
return v___x_433_;
}
else
{
lean_object* v_a_434_; lean_object* v___x_435_; size_t v___x_436_; size_t v___x_437_; 
v_a_434_ = lean_array_uget_borrowed(v_as_427_, v_i_429_);
lean_inc(v_a_434_);
v___x_435_ = lean_array_push(v_b_430_, v_a_434_);
v___x_436_ = ((size_t)1ULL);
v___x_437_ = lean_usize_add(v_i_429_, v___x_436_);
v_i_429_ = v___x_437_;
v_b_430_ = v___x_435_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0___boxed(lean_object* v_as_439_, lean_object* v_sz_440_, lean_object* v_i_441_, lean_object* v_b_442_, lean_object* v___y_443_){
_start:
{
size_t v_sz_boxed_444_; size_t v_i_boxed_445_; lean_object* v_res_446_; 
v_sz_boxed_444_ = lean_unbox_usize(v_sz_440_);
lean_dec(v_sz_440_);
v_i_boxed_445_ = lean_unbox_usize(v_i_441_);
lean_dec(v_i_441_);
v_res_446_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0(v_as_439_, v_sz_boxed_444_, v_i_boxed_445_, v_b_442_);
lean_dec_ref(v_as_439_);
return v_res_446_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1(lean_object* v_as_447_, size_t v_sz_448_, size_t v_i_449_, lean_object* v_b_450_){
_start:
{
uint8_t v___x_452_; 
v___x_452_ = lean_usize_dec_lt(v_i_449_, v_sz_448_);
if (v___x_452_ == 0)
{
lean_object* v___x_453_; 
v___x_453_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_453_, 0, v_b_450_);
return v___x_453_;
}
else
{
lean_object* v_a_454_; lean_object* v___x_455_; size_t v___x_456_; size_t v___x_457_; lean_object* v___x_458_; 
v_a_454_ = lean_array_uget_borrowed(v_as_447_, v_i_449_);
lean_inc(v_a_454_);
v___x_455_ = lean_array_push(v_b_450_, v_a_454_);
v___x_456_ = ((size_t)1ULL);
v___x_457_ = lean_usize_add(v_i_449_, v___x_456_);
v___x_458_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0(v_as_447_, v_sz_448_, v___x_457_, v___x_455_);
return v___x_458_;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1___boxed(lean_object* v_as_459_, lean_object* v_sz_460_, lean_object* v_i_461_, lean_object* v_b_462_, lean_object* v___y_463_){
_start:
{
size_t v_sz_boxed_464_; size_t v_i_boxed_465_; lean_object* v_res_466_; 
v_sz_boxed_464_ = lean_unbox_usize(v_sz_460_);
lean_dec(v_sz_460_);
v_i_boxed_465_ = lean_unbox_usize(v_i_461_);
lean_dec(v_i_461_);
v_res_466_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1(v_as_459_, v_sz_boxed_464_, v_i_boxed_465_, v_b_462_);
lean_dec_ref(v_as_459_);
return v_res_466_;
}
}
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg(lean_object* v_as_x27_472_, lean_object* v_b_473_){
_start:
{
if (lean_obj_tag(v_as_x27_472_) == 0)
{
lean_object* v___x_475_; 
v___x_475_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_475_, 0, v_b_473_);
return v___x_475_;
}
else
{
lean_object* v_head_476_; lean_object* v_tail_477_; lean_object* v_fst_478_; lean_object* v_snd_479_; lean_object* v___x_481_; uint8_t v_isShared_482_; uint8_t v_isSharedCheck_566_; 
v_head_476_ = lean_ctor_get(v_as_x27_472_, 0);
v_tail_477_ = lean_ctor_get(v_as_x27_472_, 1);
v_fst_478_ = lean_ctor_get(v_b_473_, 0);
v_snd_479_ = lean_ctor_get(v_b_473_, 1);
v_isSharedCheck_566_ = !lean_is_exclusive(v_b_473_);
if (v_isSharedCheck_566_ == 0)
{
v___x_481_ = v_b_473_;
v_isShared_482_ = v_isSharedCheck_566_;
goto v_resetjp_480_;
}
else
{
lean_inc(v_snd_479_);
lean_inc(v_fst_478_);
lean_dec(v_b_473_);
v___x_481_ = lean_box(0);
v_isShared_482_ = v_isSharedCheck_566_;
goto v_resetjp_480_;
}
v_resetjp_480_:
{
lean_object* v_ctor_483_; lean_object* v_rhs_484_; lean_object* v___x_485_; 
v_ctor_483_ = lean_ctor_get(v_head_476_, 0);
v_rhs_484_ = lean_ctor_get(v_head_476_, 2);
lean_inc_ref(v_rhs_484_);
v___x_485_ = l_CathedralKernelGraph_exprRefs(v_rhs_484_);
if (lean_obj_tag(v___x_485_) == 0)
{
lean_object* v_a_486_; lean_object* v_constants_487_; lean_object* v_projections_488_; uint8_t v_hasNatLit_489_; uint8_t v_hasStrLit_490_; lean_object* v___x_491_; size_t v_sz_492_; size_t v___x_493_; lean_object* v___x_494_; 
v_a_486_ = lean_ctor_get(v___x_485_, 0);
lean_inc(v_a_486_);
lean_dec_ref_known(v___x_485_, 1);
v_constants_487_ = lean_ctor_get(v_a_486_, 0);
lean_inc_ref(v_constants_487_);
v_projections_488_ = lean_ctor_get(v_a_486_, 1);
lean_inc_ref(v_projections_488_);
v_hasNatLit_489_ = lean_ctor_get_uint8(v_a_486_, sizeof(void*)*2);
v_hasStrLit_490_ = lean_ctor_get_uint8(v_a_486_, sizeof(void*)*2 + 1);
lean_inc(v_ctor_483_);
v___x_491_ = lean_array_push(v_snd_479_, v_ctor_483_);
v_sz_492_ = lean_array_size(v_constants_487_);
v___x_493_ = ((size_t)0ULL);
v___x_494_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__0(v_constants_487_, v_sz_492_, v___x_493_, v___x_491_);
if (lean_obj_tag(v___x_494_) == 0)
{
lean_object* v_a_495_; size_t v_sz_496_; lean_object* v___x_497_; 
v_a_495_ = lean_ctor_get(v___x_494_, 0);
lean_inc(v_a_495_);
lean_dec_ref_known(v___x_494_, 1);
v_sz_496_ = lean_array_size(v_projections_488_);
v___x_497_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1(v_projections_488_, v_sz_496_, v___x_493_, v_a_495_);
if (lean_obj_tag(v___x_497_) == 0)
{
lean_object* v_a_498_; lean_object* v___x_499_; size_t v_sz_500_; lean_object* v___x_501_; 
v_a_498_ = lean_ctor_get(v___x_497_, 0);
lean_inc(v_a_498_);
lean_dec_ref_known(v___x_497_, 1);
v___x_499_ = l_CathedralKernelGraph_ExprRefs_literalNames(v_a_486_);
lean_dec(v_a_486_);
v_sz_500_ = lean_array_size(v___x_499_);
v___x_501_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_record_spec__1(v___x_499_, v_sz_500_, v___x_493_, v_a_498_);
if (lean_obj_tag(v___x_501_) == 0)
{
lean_object* v_a_502_; lean_object* v___x_503_; lean_object* v___x_504_; lean_object* v___x_506_; 
v_a_502_ = lean_ctor_get(v___x_501_, 0);
lean_inc(v_a_502_);
lean_dec_ref_known(v___x_501_, 1);
v___x_503_ = ((lean_object*)(l_CathedralKernelGraph_kind___closed__6));
lean_inc(v_ctor_483_);
v___x_504_ = l_CathedralKernelGraph_jid(v_ctor_483_);
if (v_isShared_482_ == 0)
{
lean_ctor_set(v___x_481_, 1, v___x_504_);
lean_ctor_set(v___x_481_, 0, v___x_503_);
v___x_506_ = v___x_481_;
goto v_reusejp_505_;
}
else
{
lean_object* v_reuseFailAlloc_533_; 
v_reuseFailAlloc_533_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_533_, 0, v___x_503_);
lean_ctor_set(v_reuseFailAlloc_533_, 1, v___x_504_);
v___x_506_ = v_reuseFailAlloc_533_;
goto v_reusejp_505_;
}
v_reusejp_505_:
{
lean_object* v___x_507_; lean_object* v___x_508_; lean_object* v___x_509_; lean_object* v___x_510_; lean_object* v___x_511_; lean_object* v___x_512_; lean_object* v___x_513_; lean_object* v___x_514_; lean_object* v___x_515_; lean_object* v___x_516_; lean_object* v___x_517_; lean_object* v___x_518_; lean_object* v___x_519_; lean_object* v___x_520_; lean_object* v___x_521_; lean_object* v___x_522_; lean_object* v___x_523_; lean_object* v___x_524_; lean_object* v___x_525_; lean_object* v___x_526_; lean_object* v___x_527_; lean_object* v___x_528_; lean_object* v___x_529_; lean_object* v___x_530_; lean_object* v___x_531_; 
v___x_507_ = ((lean_object*)(l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__0));
v___x_508_ = l_CathedralKernelGraph_jnames(v_constants_487_);
v___x_509_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_509_, 0, v___x_507_);
lean_ctor_set(v___x_509_, 1, v___x_508_);
v___x_510_ = ((lean_object*)(l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__1));
v___x_511_ = l_CathedralKernelGraph_jnames(v_projections_488_);
v___x_512_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_512_, 0, v___x_510_);
lean_ctor_set(v___x_512_, 1, v___x_511_);
v___x_513_ = ((lean_object*)(l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__2));
v___x_514_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_514_, 0, v_hasNatLit_489_);
v___x_515_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_515_, 0, v___x_513_);
lean_ctor_set(v___x_515_, 1, v___x_514_);
v___x_516_ = ((lean_object*)(l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__3));
v___x_517_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_517_, 0, v_hasStrLit_490_);
v___x_518_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_518_, 0, v___x_516_);
lean_ctor_set(v___x_518_, 1, v___x_517_);
v___x_519_ = ((lean_object*)(l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___closed__4));
v___x_520_ = l_CathedralKernelGraph_jnames(v___x_499_);
v___x_521_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_521_, 0, v___x_519_);
lean_ctor_set(v___x_521_, 1, v___x_520_);
v___x_522_ = lean_box(0);
v___x_523_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_523_, 0, v___x_521_);
lean_ctor_set(v___x_523_, 1, v___x_522_);
v___x_524_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_524_, 0, v___x_518_);
lean_ctor_set(v___x_524_, 1, v___x_523_);
v___x_525_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_525_, 0, v___x_515_);
lean_ctor_set(v___x_525_, 1, v___x_524_);
v___x_526_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_526_, 0, v___x_512_);
lean_ctor_set(v___x_526_, 1, v___x_525_);
v___x_527_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_527_, 0, v___x_509_);
lean_ctor_set(v___x_527_, 1, v___x_526_);
v___x_528_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_528_, 0, v___x_506_);
lean_ctor_set(v___x_528_, 1, v___x_527_);
v___x_529_ = l_Lean_Json_mkObj(v___x_528_);
lean_dec_ref_known(v___x_528_, 2);
v___x_530_ = lean_array_push(v_fst_478_, v___x_529_);
v___x_531_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_531_, 0, v___x_530_);
lean_ctor_set(v___x_531_, 1, v_a_502_);
v_as_x27_472_ = v_tail_477_;
v_b_473_ = v___x_531_;
goto _start;
}
}
else
{
lean_object* v_a_534_; lean_object* v___x_536_; uint8_t v_isShared_537_; uint8_t v_isSharedCheck_541_; 
lean_dec_ref(v___x_499_);
lean_dec_ref(v_projections_488_);
lean_dec_ref(v_constants_487_);
lean_del_object(v___x_481_);
lean_dec(v_fst_478_);
v_a_534_ = lean_ctor_get(v___x_501_, 0);
v_isSharedCheck_541_ = !lean_is_exclusive(v___x_501_);
if (v_isSharedCheck_541_ == 0)
{
v___x_536_ = v___x_501_;
v_isShared_537_ = v_isSharedCheck_541_;
goto v_resetjp_535_;
}
else
{
lean_inc(v_a_534_);
lean_dec(v___x_501_);
v___x_536_ = lean_box(0);
v_isShared_537_ = v_isSharedCheck_541_;
goto v_resetjp_535_;
}
v_resetjp_535_:
{
lean_object* v___x_539_; 
if (v_isShared_537_ == 0)
{
v___x_539_ = v___x_536_;
goto v_reusejp_538_;
}
else
{
lean_object* v_reuseFailAlloc_540_; 
v_reuseFailAlloc_540_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_540_, 0, v_a_534_);
v___x_539_ = v_reuseFailAlloc_540_;
goto v_reusejp_538_;
}
v_reusejp_538_:
{
return v___x_539_;
}
}
}
}
else
{
lean_object* v_a_542_; lean_object* v___x_544_; uint8_t v_isShared_545_; uint8_t v_isSharedCheck_549_; 
lean_dec_ref(v_projections_488_);
lean_dec_ref(v_constants_487_);
lean_dec(v_a_486_);
lean_del_object(v___x_481_);
lean_dec(v_fst_478_);
v_a_542_ = lean_ctor_get(v___x_497_, 0);
v_isSharedCheck_549_ = !lean_is_exclusive(v___x_497_);
if (v_isSharedCheck_549_ == 0)
{
v___x_544_ = v___x_497_;
v_isShared_545_ = v_isSharedCheck_549_;
goto v_resetjp_543_;
}
else
{
lean_inc(v_a_542_);
lean_dec(v___x_497_);
v___x_544_ = lean_box(0);
v_isShared_545_ = v_isSharedCheck_549_;
goto v_resetjp_543_;
}
v_resetjp_543_:
{
lean_object* v___x_547_; 
if (v_isShared_545_ == 0)
{
v___x_547_ = v___x_544_;
goto v_reusejp_546_;
}
else
{
lean_object* v_reuseFailAlloc_548_; 
v_reuseFailAlloc_548_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_548_, 0, v_a_542_);
v___x_547_ = v_reuseFailAlloc_548_;
goto v_reusejp_546_;
}
v_reusejp_546_:
{
return v___x_547_;
}
}
}
}
else
{
lean_object* v_a_550_; lean_object* v___x_552_; uint8_t v_isShared_553_; uint8_t v_isSharedCheck_557_; 
lean_dec_ref(v_projections_488_);
lean_dec_ref(v_constants_487_);
lean_dec(v_a_486_);
lean_del_object(v___x_481_);
lean_dec(v_fst_478_);
v_a_550_ = lean_ctor_get(v___x_494_, 0);
v_isSharedCheck_557_ = !lean_is_exclusive(v___x_494_);
if (v_isSharedCheck_557_ == 0)
{
v___x_552_ = v___x_494_;
v_isShared_553_ = v_isSharedCheck_557_;
goto v_resetjp_551_;
}
else
{
lean_inc(v_a_550_);
lean_dec(v___x_494_);
v___x_552_ = lean_box(0);
v_isShared_553_ = v_isSharedCheck_557_;
goto v_resetjp_551_;
}
v_resetjp_551_:
{
lean_object* v___x_555_; 
if (v_isShared_553_ == 0)
{
v___x_555_ = v___x_552_;
goto v_reusejp_554_;
}
else
{
lean_object* v_reuseFailAlloc_556_; 
v_reuseFailAlloc_556_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_556_, 0, v_a_550_);
v___x_555_ = v_reuseFailAlloc_556_;
goto v_reusejp_554_;
}
v_reusejp_554_:
{
return v___x_555_;
}
}
}
}
else
{
lean_object* v_a_558_; lean_object* v___x_560_; uint8_t v_isShared_561_; uint8_t v_isSharedCheck_565_; 
lean_del_object(v___x_481_);
lean_dec(v_snd_479_);
lean_dec(v_fst_478_);
v_a_558_ = lean_ctor_get(v___x_485_, 0);
v_isSharedCheck_565_ = !lean_is_exclusive(v___x_485_);
if (v_isSharedCheck_565_ == 0)
{
v___x_560_ = v___x_485_;
v_isShared_561_ = v_isSharedCheck_565_;
goto v_resetjp_559_;
}
else
{
lean_inc(v_a_558_);
lean_dec(v___x_485_);
v___x_560_ = lean_box(0);
v_isShared_561_ = v_isSharedCheck_565_;
goto v_resetjp_559_;
}
v_resetjp_559_:
{
lean_object* v___x_563_; 
if (v_isShared_561_ == 0)
{
v___x_563_ = v___x_560_;
goto v_reusejp_562_;
}
else
{
lean_object* v_reuseFailAlloc_564_; 
v_reuseFailAlloc_564_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_564_, 0, v_a_558_);
v___x_563_ = v_reuseFailAlloc_564_;
goto v_reusejp_562_;
}
v_reusejp_562_:
{
return v___x_563_;
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg___boxed(lean_object* v_as_x27_567_, lean_object* v_b_568_, lean_object* v___y_569_){
_start:
{
lean_object* v_res_570_; 
v_res_570_ = l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg(v_as_x27_567_, v_b_568_);
lean_dec(v_as_x27_567_);
return v_res_570_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_record(lean_object* v_env_633_, lean_object* v_c_634_){
_start:
{
uint8_t v___y_637_; lean_object* v___y_638_; lean_object* v___y_639_; lean_object* v___y_640_; lean_object* v___y_641_; lean_object* v___y_642_; lean_object* v___y_643_; lean_object* v___y_644_; lean_object* v___y_645_; lean_object* v___y_646_; lean_object* v___y_647_; lean_object* v___y_648_; lean_object* v___y_649_; lean_object* v___y_650_; uint8_t v___y_651_; uint8_t v___y_652_; lean_object* v___y_653_; lean_object* v___y_654_; lean_object* v___y_655_; uint8_t v___y_656_; lean_object* v___y_657_; lean_object* v___y_658_; lean_object* v___y_659_; lean_object* v___y_660_; lean_object* v___y_661_; uint8_t v___y_662_; lean_object* v___x_741_; lean_object* v___x_742_; 
v___x_741_ = l_Lean_ConstantInfo_type(v_c_634_);
v___x_742_ = l_CathedralKernelGraph_exprRefs(v___x_741_);
if (lean_obj_tag(v___x_742_) == 0)
{
lean_object* v_a_743_; lean_object* v___y_745_; lean_object* v_ctors_746_; lean_object* v_group_747_; lean_object* v_parent_748_; lean_object* v_rules_749_; lean_object* v_mutualBlock_750_; lean_object* v_quotPkg_751_; lean_object* v_ruleRefs_752_; lean_object* v_vr_804_; uint8_t v___x_843_; lean_object* v___x_844_; 
v_a_743_ = lean_ctor_get(v___x_742_, 0);
lean_inc(v_a_743_);
lean_dec_ref_known(v___x_742_, 1);
v___x_843_ = 1;
lean_inc_ref(v_c_634_);
v___x_844_ = l_Lean_ConstantInfo_value_x3f(v_c_634_, v___x_843_);
if (lean_obj_tag(v___x_844_) == 0)
{
lean_object* v___x_845_; 
v___x_845_ = ((lean_object*)(l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__1));
v_vr_804_ = v___x_845_;
goto v___jp_803_;
}
else
{
lean_object* v_val_846_; lean_object* v___x_847_; 
v_val_846_ = lean_ctor_get(v___x_844_, 0);
lean_inc(v_val_846_);
lean_dec_ref_known(v___x_844_, 1);
v___x_847_ = l_CathedralKernelGraph_exprRefs(v_val_846_);
if (lean_obj_tag(v___x_847_) == 0)
{
lean_object* v_a_848_; 
v_a_848_ = lean_ctor_get(v___x_847_, 0);
lean_inc(v_a_848_);
lean_dec_ref_known(v___x_847_, 1);
v_vr_804_ = v_a_848_;
goto v___jp_803_;
}
else
{
lean_object* v_a_849_; lean_object* v___x_851_; uint8_t v_isShared_852_; uint8_t v_isSharedCheck_856_; 
lean_dec(v_a_743_);
lean_dec_ref(v_c_634_);
v_a_849_ = lean_ctor_get(v___x_847_, 0);
v_isSharedCheck_856_ = !lean_is_exclusive(v___x_847_);
if (v_isSharedCheck_856_ == 0)
{
v___x_851_ = v___x_847_;
v_isShared_852_ = v_isSharedCheck_856_;
goto v_resetjp_850_;
}
else
{
lean_inc(v_a_849_);
lean_dec(v___x_847_);
v___x_851_ = lean_box(0);
v_isShared_852_ = v_isSharedCheck_856_;
goto v_resetjp_850_;
}
v_resetjp_850_:
{
lean_object* v___x_854_; 
if (v_isShared_852_ == 0)
{
v___x_854_ = v___x_851_;
goto v_reusejp_853_;
}
else
{
lean_object* v_reuseFailAlloc_855_; 
v_reuseFailAlloc_855_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_855_, 0, v_a_849_);
v___x_854_ = v_reuseFailAlloc_855_;
goto v_reusejp_853_;
}
v_reusejp_853_:
{
return v___x_854_;
}
}
}
}
v___jp_744_:
{
lean_object* v_constants_753_; lean_object* v_projections_754_; uint8_t v_hasNatLit_755_; uint8_t v_hasStrLit_756_; lean_object* v_constants_757_; lean_object* v_projections_758_; uint8_t v_hasNatLit_759_; uint8_t v_hasStrLit_760_; lean_object* v___x_761_; lean_object* v___x_762_; lean_object* v___x_763_; lean_object* v___x_764_; lean_object* v___x_765_; lean_object* v___x_766_; lean_object* v___x_767_; lean_object* v___x_768_; lean_object* v___x_769_; lean_object* v___x_770_; lean_object* v___x_771_; lean_object* v___x_772_; lean_object* v___x_773_; lean_object* v___x_774_; lean_object* v___x_775_; lean_object* v___x_776_; lean_object* v___x_777_; lean_object* v___x_778_; lean_object* v___x_779_; uint8_t v___x_780_; lean_object* v___x_781_; lean_object* v___x_782_; lean_object* v___x_783_; lean_object* v___x_784_; lean_object* v___x_785_; lean_object* v___x_786_; lean_object* v___x_787_; lean_object* v___x_788_; lean_object* v___x_789_; lean_object* v___x_790_; lean_object* v___x_791_; lean_object* v___x_792_; uint8_t v___x_793_; lean_object* v___x_794_; lean_object* v___x_795_; lean_object* v___x_796_; uint8_t v___x_797_; lean_object* v___x_798_; lean_object* v___x_799_; lean_object* v___x_800_; lean_object* v___x_801_; 
v_constants_753_ = lean_ctor_get(v_a_743_, 0);
lean_inc_ref_n(v_constants_753_, 2);
v_projections_754_ = lean_ctor_get(v_a_743_, 1);
lean_inc_ref(v_projections_754_);
v_hasNatLit_755_ = lean_ctor_get_uint8(v_a_743_, sizeof(void*)*2);
v_hasStrLit_756_ = lean_ctor_get_uint8(v_a_743_, sizeof(void*)*2 + 1);
v_constants_757_ = lean_ctor_get(v___y_745_, 0);
lean_inc_ref(v_constants_757_);
v_projections_758_ = lean_ctor_get(v___y_745_, 1);
lean_inc_ref(v_projections_758_);
v_hasNatLit_759_ = lean_ctor_get_uint8(v___y_745_, sizeof(void*)*2);
v_hasStrLit_760_ = lean_ctor_get_uint8(v___y_745_, sizeof(void*)*2 + 1);
v___x_761_ = l_Array_append___redArg(v_constants_753_, v_constants_757_);
v___x_762_ = l_Array_append___redArg(v___x_761_, v_projections_754_);
v___x_763_ = l_Array_append___redArg(v___x_762_, v_projections_758_);
v___x_764_ = l_CathedralKernelGraph_ExprRefs_literalNames(v_a_743_);
lean_dec(v_a_743_);
v___x_765_ = l_Array_append___redArg(v___x_763_, v___x_764_);
v___x_766_ = l_CathedralKernelGraph_ExprRefs_literalNames(v___y_745_);
lean_dec_ref(v___y_745_);
v___x_767_ = l_Array_append___redArg(v___x_765_, v___x_766_);
v___x_768_ = l_Array_append___redArg(v___x_767_, v_ctors_746_);
v___x_769_ = l_Array_append___redArg(v___x_768_, v_group_747_);
v___x_770_ = l_Array_append___redArg(v___x_769_, v_parent_748_);
v___x_771_ = l_Array_append___redArg(v___x_770_, v_ruleRefs_752_);
lean_dec_ref(v_ruleRefs_752_);
v___x_772_ = l_Array_append___redArg(v___x_771_, v_mutualBlock_750_);
v___x_773_ = l_Array_append___redArg(v___x_772_, v_quotPkg_751_);
v___x_774_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__19));
v___x_775_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__20));
v___x_776_ = l_Lean_ConstantInfo_name(v_c_634_);
lean_inc_n(v___x_776_, 2);
v___x_777_ = l_CathedralKernelGraph_jid(v___x_776_);
v___x_778_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_778_, 0, v___x_775_);
lean_ctor_set(v___x_778_, 1, v___x_777_);
v___x_779_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__21));
v___x_780_ = 1;
v___x_781_ = l_Lean_Name_toStringWithToken___at___00Lean_Name_toString_spec__0(v___x_776_, v___x_780_);
v___x_782_ = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(v___x_782_, 0, v___x_781_);
v___x_783_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_783_, 0, v___x_779_);
lean_ctor_set(v___x_783_, 1, v___x_782_);
v___x_784_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__22));
v___x_785_ = l_CathedralKernelGraph_moduleName(v_env_633_, v___x_776_);
lean_dec(v___x_776_);
v___x_786_ = l_CathedralKernelGraph_jid(v___x_785_);
v___x_787_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_787_, 0, v___x_784_);
lean_ctor_set(v___x_787_, 1, v___x_786_);
v___x_788_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__23));
v___x_789_ = l_CathedralKernelGraph_kind(v_c_634_);
v___x_790_ = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(v___x_790_, 0, v___x_789_);
v___x_791_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_791_, 0, v___x_788_);
lean_ctor_set(v___x_791_, 1, v___x_790_);
v___x_792_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__24));
v___x_793_ = l_Lean_ConstantInfo_isUnsafe(v_c_634_);
v___x_794_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_794_, 0, v___x_793_);
v___x_795_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_795_, 0, v___x_792_);
lean_ctor_set(v___x_795_, 1, v___x_794_);
v___x_796_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__25));
v___x_797_ = l_Lean_ConstantInfo_isPartial(v_c_634_);
v___x_798_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_798_, 0, v___x_797_);
v___x_799_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_799_, 0, v___x_796_);
lean_ctor_set(v___x_799_, 1, v___x_798_);
v___x_800_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__26));
v___x_801_ = l_Lean_ConstantInfo_value_x3f(v_c_634_, v___x_780_);
if (lean_obj_tag(v___x_801_) == 0)
{
uint8_t v___x_802_; 
v___x_802_ = 0;
v___y_637_ = v_hasNatLit_759_;
v___y_638_ = v___x_774_;
v___y_639_ = v___x_773_;
v___y_640_ = v___x_800_;
v___y_641_ = v_rules_749_;
v___y_642_ = v_parent_748_;
v___y_643_ = v___x_783_;
v___y_644_ = v___x_787_;
v___y_645_ = v___x_778_;
v___y_646_ = v___x_799_;
v___y_647_ = v_constants_753_;
v___y_648_ = v___x_766_;
v___y_649_ = v_projections_758_;
v___y_650_ = v___x_791_;
v___y_651_ = v_hasStrLit_756_;
v___y_652_ = v_hasNatLit_755_;
v___y_653_ = v_ctors_746_;
v___y_654_ = v___x_795_;
v___y_655_ = v_projections_754_;
v___y_656_ = v_hasStrLit_760_;
v___y_657_ = v_group_747_;
v___y_658_ = v_mutualBlock_750_;
v___y_659_ = v_quotPkg_751_;
v___y_660_ = v_constants_757_;
v___y_661_ = v___x_764_;
v___y_662_ = v___x_802_;
goto v___jp_636_;
}
else
{
lean_dec_ref_known(v___x_801_, 1);
v___y_637_ = v_hasNatLit_759_;
v___y_638_ = v___x_774_;
v___y_639_ = v___x_773_;
v___y_640_ = v___x_800_;
v___y_641_ = v_rules_749_;
v___y_642_ = v_parent_748_;
v___y_643_ = v___x_783_;
v___y_644_ = v___x_787_;
v___y_645_ = v___x_778_;
v___y_646_ = v___x_799_;
v___y_647_ = v_constants_753_;
v___y_648_ = v___x_766_;
v___y_649_ = v_projections_758_;
v___y_650_ = v___x_791_;
v___y_651_ = v_hasStrLit_756_;
v___y_652_ = v_hasNatLit_755_;
v___y_653_ = v_ctors_746_;
v___y_654_ = v___x_795_;
v___y_655_ = v_projections_754_;
v___y_656_ = v_hasStrLit_760_;
v___y_657_ = v_group_747_;
v___y_658_ = v_mutualBlock_750_;
v___y_659_ = v_quotPkg_751_;
v___y_660_ = v_constants_757_;
v___y_661_ = v___x_764_;
v___y_662_ = v___x_780_;
goto v___jp_636_;
}
}
v___jp_803_:
{
lean_object* v___x_805_; 
v___x_805_ = ((lean_object*)(l_CathedralKernelGraph_instInhabitedExprRefs_default___closed__0));
switch(lean_obj_tag(v_c_634_))
{
case 1:
{
lean_object* v_val_806_; lean_object* v_all_807_; lean_object* v___x_808_; 
v_val_806_ = lean_ctor_get(v_c_634_, 0);
v_all_807_ = lean_ctor_get(v_val_806_, 3);
lean_inc(v_all_807_);
v___x_808_ = lean_array_mk(v_all_807_);
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_805_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_808_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
case 2:
{
lean_object* v_val_809_; lean_object* v_all_810_; lean_object* v___x_811_; 
v_val_809_ = lean_ctor_get(v_c_634_, 0);
v_all_810_ = lean_ctor_get(v_val_809_, 2);
lean_inc(v_all_810_);
v___x_811_ = lean_array_mk(v_all_810_);
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_805_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_811_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
case 3:
{
lean_object* v_val_812_; lean_object* v_all_813_; lean_object* v___x_814_; 
v_val_812_ = lean_ctor_get(v_c_634_, 0);
v_all_813_ = lean_ctor_get(v_val_812_, 2);
lean_inc(v_all_813_);
v___x_814_ = lean_array_mk(v_all_813_);
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_805_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_814_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
case 4:
{
lean_object* v___x_815_; 
v___x_815_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__37));
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_805_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_805_;
v_quotPkg_751_ = v___x_815_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
case 5:
{
lean_object* v_val_816_; lean_object* v_all_817_; lean_object* v_ctors_818_; lean_object* v___x_819_; lean_object* v___x_820_; 
v_val_816_ = lean_ctor_get(v_c_634_, 0);
v_all_817_ = lean_ctor_get(v_val_816_, 3);
v_ctors_818_ = lean_ctor_get(v_val_816_, 4);
lean_inc(v_ctors_818_);
v___x_819_ = lean_array_mk(v_ctors_818_);
lean_inc(v_all_817_);
v___x_820_ = lean_array_mk(v_all_817_);
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_819_;
v_group_747_ = v___x_820_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_805_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
case 6:
{
lean_object* v_val_821_; lean_object* v_induct_822_; lean_object* v___x_823_; lean_object* v___x_824_; lean_object* v___x_825_; 
v_val_821_ = lean_ctor_get(v_c_634_, 0);
v_induct_822_ = lean_ctor_get(v_val_821_, 1);
v___x_823_ = lean_unsigned_to_nat(1u);
v___x_824_ = lean_mk_empty_array_with_capacity(v___x_823_);
lean_inc(v_induct_822_);
v___x_825_ = lean_array_push(v___x_824_, v_induct_822_);
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_805_;
v_parent_748_ = v___x_825_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_805_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
case 7:
{
lean_object* v_val_826_; lean_object* v_all_827_; lean_object* v_rules_828_; lean_object* v___x_829_; lean_object* v___x_830_; lean_object* v___x_831_; 
v_val_826_ = lean_ctor_get(v_c_634_, 0);
v_all_827_ = lean_ctor_get(v_val_826_, 1);
v_rules_828_ = lean_ctor_get(v_val_826_, 6);
lean_inc(v_all_827_);
v___x_829_ = lean_array_mk(v_all_827_);
v___x_830_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__38));
v___x_831_ = l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg(v_rules_828_, v___x_830_);
if (lean_obj_tag(v___x_831_) == 0)
{
lean_object* v_a_832_; lean_object* v_fst_833_; lean_object* v_snd_834_; 
v_a_832_ = lean_ctor_get(v___x_831_, 0);
lean_inc(v_a_832_);
lean_dec_ref_known(v___x_831_, 1);
v_fst_833_ = lean_ctor_get(v_a_832_, 0);
lean_inc(v_fst_833_);
v_snd_834_ = lean_ctor_get(v_a_832_, 1);
lean_inc(v_snd_834_);
lean_dec(v_a_832_);
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_829_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v_fst_833_;
v_mutualBlock_750_ = v___x_805_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v_snd_834_;
goto v___jp_744_;
}
else
{
lean_object* v_a_835_; lean_object* v___x_837_; uint8_t v_isShared_838_; uint8_t v_isSharedCheck_842_; 
lean_dec_ref(v___x_829_);
lean_dec_ref_known(v_c_634_, 1);
lean_dec_ref(v_vr_804_);
lean_dec(v_a_743_);
v_a_835_ = lean_ctor_get(v___x_831_, 0);
v_isSharedCheck_842_ = !lean_is_exclusive(v___x_831_);
if (v_isSharedCheck_842_ == 0)
{
v___x_837_ = v___x_831_;
v_isShared_838_ = v_isSharedCheck_842_;
goto v_resetjp_836_;
}
else
{
lean_inc(v_a_835_);
lean_dec(v___x_831_);
v___x_837_ = lean_box(0);
v_isShared_838_ = v_isSharedCheck_842_;
goto v_resetjp_836_;
}
v_resetjp_836_:
{
lean_object* v___x_840_; 
if (v_isShared_838_ == 0)
{
v___x_840_ = v___x_837_;
goto v_reusejp_839_;
}
else
{
lean_object* v_reuseFailAlloc_841_; 
v_reuseFailAlloc_841_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_841_, 0, v_a_835_);
v___x_840_ = v_reuseFailAlloc_841_;
goto v_reusejp_839_;
}
v_reusejp_839_:
{
return v___x_840_;
}
}
}
}
default: 
{
v___y_745_ = v_vr_804_;
v_ctors_746_ = v___x_805_;
v_group_747_ = v___x_805_;
v_parent_748_ = v___x_805_;
v_rules_749_ = v___x_805_;
v_mutualBlock_750_ = v___x_805_;
v_quotPkg_751_ = v___x_805_;
v_ruleRefs_752_ = v___x_805_;
goto v___jp_744_;
}
}
}
}
else
{
lean_object* v_a_857_; lean_object* v___x_859_; uint8_t v_isShared_860_; uint8_t v_isSharedCheck_864_; 
lean_dec_ref(v_c_634_);
v_a_857_ = lean_ctor_get(v___x_742_, 0);
v_isSharedCheck_864_ = !lean_is_exclusive(v___x_742_);
if (v_isSharedCheck_864_ == 0)
{
v___x_859_ = v___x_742_;
v_isShared_860_ = v_isSharedCheck_864_;
goto v_resetjp_858_;
}
else
{
lean_inc(v_a_857_);
lean_dec(v___x_742_);
v___x_859_ = lean_box(0);
v_isShared_860_ = v_isSharedCheck_864_;
goto v_resetjp_858_;
}
v_resetjp_858_:
{
lean_object* v___x_862_; 
if (v_isShared_860_ == 0)
{
v___x_862_ = v___x_859_;
goto v_reusejp_861_;
}
else
{
lean_object* v_reuseFailAlloc_863_; 
v_reuseFailAlloc_863_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_863_, 0, v_a_857_);
v___x_862_ = v_reuseFailAlloc_863_;
goto v_reusejp_861_;
}
v_reusejp_861_:
{
return v___x_862_;
}
}
}
v___jp_636_:
{
lean_object* v___x_663_; lean_object* v___x_664_; lean_object* v___x_665_; lean_object* v___x_666_; lean_object* v___x_667_; lean_object* v___x_668_; lean_object* v___x_669_; lean_object* v___x_670_; lean_object* v___x_671_; lean_object* v___x_672_; lean_object* v___x_673_; lean_object* v___x_674_; lean_object* v___x_675_; lean_object* v___x_676_; lean_object* v___x_677_; lean_object* v___x_678_; lean_object* v___x_679_; lean_object* v___x_680_; lean_object* v___x_681_; lean_object* v___x_682_; lean_object* v___x_683_; lean_object* v___x_684_; lean_object* v___x_685_; lean_object* v___x_686_; lean_object* v___x_687_; lean_object* v___x_688_; lean_object* v___x_689_; lean_object* v___x_690_; lean_object* v___x_691_; lean_object* v___x_692_; lean_object* v___x_693_; lean_object* v___x_694_; lean_object* v___x_695_; lean_object* v___x_696_; lean_object* v___x_697_; lean_object* v___x_698_; lean_object* v___x_699_; lean_object* v___x_700_; lean_object* v___x_701_; lean_object* v___x_702_; lean_object* v___x_703_; lean_object* v___x_704_; lean_object* v___x_705_; lean_object* v___x_706_; lean_object* v___x_707_; lean_object* v___x_708_; lean_object* v___x_709_; lean_object* v___x_710_; lean_object* v___x_711_; lean_object* v___x_712_; lean_object* v___x_713_; lean_object* v___x_714_; lean_object* v___x_715_; lean_object* v___x_716_; lean_object* v___x_717_; lean_object* v___x_718_; lean_object* v___x_719_; lean_object* v___x_720_; lean_object* v___x_721_; lean_object* v___x_722_; lean_object* v___x_723_; lean_object* v___x_724_; lean_object* v___x_725_; lean_object* v___x_726_; lean_object* v___x_727_; lean_object* v___x_728_; lean_object* v___x_729_; lean_object* v___x_730_; lean_object* v___x_731_; lean_object* v___x_732_; lean_object* v___x_733_; lean_object* v___x_734_; lean_object* v___x_735_; lean_object* v___x_736_; lean_object* v___x_737_; lean_object* v___x_738_; lean_object* v___x_739_; lean_object* v___x_740_; 
v___x_663_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_663_, 0, v___y_662_);
lean_inc_ref(v___y_640_);
v___x_664_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_664_, 0, v___y_640_);
lean_ctor_set(v___x_664_, 1, v___x_663_);
v___x_665_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__0));
v___x_666_ = l_CathedralKernelGraph_jnames(v___y_647_);
v___x_667_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_667_, 0, v___x_665_);
lean_ctor_set(v___x_667_, 1, v___x_666_);
v___x_668_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__1));
v___x_669_ = l_CathedralKernelGraph_jnames(v___y_660_);
v___x_670_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_670_, 0, v___x_668_);
lean_ctor_set(v___x_670_, 1, v___x_669_);
v___x_671_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__2));
v___x_672_ = l_CathedralKernelGraph_jnames(v___y_655_);
v___x_673_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_673_, 0, v___x_671_);
lean_ctor_set(v___x_673_, 1, v___x_672_);
v___x_674_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__3));
v___x_675_ = l_CathedralKernelGraph_jnames(v___y_649_);
v___x_676_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_676_, 0, v___x_674_);
lean_ctor_set(v___x_676_, 1, v___x_675_);
v___x_677_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__4));
v___x_678_ = l_CathedralKernelGraph_jnames(v___y_653_);
v___x_679_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_679_, 0, v___x_677_);
lean_ctor_set(v___x_679_, 1, v___x_678_);
v___x_680_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__5));
v___x_681_ = l_CathedralKernelGraph_jnames(v___y_657_);
v___x_682_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_682_, 0, v___x_680_);
lean_ctor_set(v___x_682_, 1, v___x_681_);
v___x_683_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__6));
v___x_684_ = l_CathedralKernelGraph_jnames(v___y_642_);
v___x_685_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_685_, 0, v___x_683_);
lean_ctor_set(v___x_685_, 1, v___x_684_);
v___x_686_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__7));
v___x_687_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_687_, 0, v___y_652_);
v___x_688_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_688_, 0, v___x_686_);
lean_ctor_set(v___x_688_, 1, v___x_687_);
v___x_689_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__8));
v___x_690_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_690_, 0, v___y_651_);
v___x_691_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_691_, 0, v___x_689_);
lean_ctor_set(v___x_691_, 1, v___x_690_);
v___x_692_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__9));
v___x_693_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_693_, 0, v___y_637_);
v___x_694_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_694_, 0, v___x_692_);
lean_ctor_set(v___x_694_, 1, v___x_693_);
v___x_695_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__10));
v___x_696_ = lean_alloc_ctor(1, 0, 1);
lean_ctor_set_uint8(v___x_696_, 0, v___y_656_);
v___x_697_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_697_, 0, v___x_695_);
lean_ctor_set(v___x_697_, 1, v___x_696_);
v___x_698_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__11));
v___x_699_ = l_CathedralKernelGraph_jnames(v___y_661_);
v___x_700_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_700_, 0, v___x_698_);
lean_ctor_set(v___x_700_, 1, v___x_699_);
v___x_701_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__12));
v___x_702_ = l_CathedralKernelGraph_jnames(v___y_648_);
v___x_703_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_703_, 0, v___x_701_);
lean_ctor_set(v___x_703_, 1, v___x_702_);
v___x_704_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__13));
v___x_705_ = l_CathedralKernelGraph_jnames(v___y_658_);
v___x_706_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_706_, 0, v___x_704_);
lean_ctor_set(v___x_706_, 1, v___x_705_);
v___x_707_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__14));
v___x_708_ = l_CathedralKernelGraph_jnames(v___y_659_);
v___x_709_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_709_, 0, v___x_707_);
lean_ctor_set(v___x_709_, 1, v___x_708_);
v___x_710_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__15));
v___x_711_ = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(v___x_711_, 0, v___y_641_);
v___x_712_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_712_, 0, v___x_710_);
lean_ctor_set(v___x_712_, 1, v___x_711_);
v___x_713_ = lean_box(0);
v___x_714_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_714_, 0, v___x_712_);
lean_ctor_set(v___x_714_, 1, v___x_713_);
v___x_715_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_715_, 0, v___x_709_);
lean_ctor_set(v___x_715_, 1, v___x_714_);
v___x_716_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_716_, 0, v___x_706_);
lean_ctor_set(v___x_716_, 1, v___x_715_);
v___x_717_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_717_, 0, v___x_703_);
lean_ctor_set(v___x_717_, 1, v___x_716_);
v___x_718_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_718_, 0, v___x_700_);
lean_ctor_set(v___x_718_, 1, v___x_717_);
v___x_719_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_719_, 0, v___x_697_);
lean_ctor_set(v___x_719_, 1, v___x_718_);
v___x_720_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_720_, 0, v___x_694_);
lean_ctor_set(v___x_720_, 1, v___x_719_);
v___x_721_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_721_, 0, v___x_691_);
lean_ctor_set(v___x_721_, 1, v___x_720_);
v___x_722_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_722_, 0, v___x_688_);
lean_ctor_set(v___x_722_, 1, v___x_721_);
v___x_723_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_723_, 0, v___x_685_);
lean_ctor_set(v___x_723_, 1, v___x_722_);
v___x_724_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_724_, 0, v___x_682_);
lean_ctor_set(v___x_724_, 1, v___x_723_);
v___x_725_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_725_, 0, v___x_679_);
lean_ctor_set(v___x_725_, 1, v___x_724_);
v___x_726_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_726_, 0, v___x_676_);
lean_ctor_set(v___x_726_, 1, v___x_725_);
v___x_727_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_727_, 0, v___x_673_);
lean_ctor_set(v___x_727_, 1, v___x_726_);
v___x_728_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_728_, 0, v___x_670_);
lean_ctor_set(v___x_728_, 1, v___x_727_);
v___x_729_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_729_, 0, v___x_667_);
lean_ctor_set(v___x_729_, 1, v___x_728_);
v___x_730_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_730_, 0, v___x_664_);
lean_ctor_set(v___x_730_, 1, v___x_729_);
v___x_731_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_731_, 0, v___y_646_);
lean_ctor_set(v___x_731_, 1, v___x_730_);
v___x_732_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_732_, 0, v___y_654_);
lean_ctor_set(v___x_732_, 1, v___x_731_);
v___x_733_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_733_, 0, v___y_650_);
lean_ctor_set(v___x_733_, 1, v___x_732_);
v___x_734_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_734_, 0, v___y_644_);
lean_ctor_set(v___x_734_, 1, v___x_733_);
v___x_735_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_735_, 0, v___y_643_);
lean_ctor_set(v___x_735_, 1, v___x_734_);
v___x_736_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_736_, 0, v___y_645_);
lean_ctor_set(v___x_736_, 1, v___x_735_);
lean_inc_ref(v___y_638_);
v___x_737_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_737_, 0, v___y_638_);
lean_ctor_set(v___x_737_, 1, v___x_736_);
v___x_738_ = l_Lean_Json_mkObj(v___x_737_);
lean_dec_ref_known(v___x_737_, 2);
v___x_739_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_739_, 0, v___x_738_);
lean_ctor_set(v___x_739_, 1, v___y_639_);
v___x_740_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_740_, 0, v___x_739_);
return v___x_740_;
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_record___boxed(lean_object* v_env_865_, lean_object* v_c_866_, lean_object* v_a_867_){
_start:
{
lean_object* v_res_868_; 
v_res_868_ = l_CathedralKernelGraph_record(v_env_865_, v_c_866_);
lean_dec_ref(v_env_865_);
return v_res_868_;
}
}
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2(lean_object* v_as_869_, lean_object* v_as_x27_870_, lean_object* v_b_871_, lean_object* v_a_872_){
_start:
{
lean_object* v___x_874_; 
v___x_874_ = l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___redArg(v_as_x27_870_, v_b_871_);
return v___x_874_;
}
}
LEAN_EXPORT lean_object* l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2___boxed(lean_object* v_as_875_, lean_object* v_as_x27_876_, lean_object* v_b_877_, lean_object* v_a_878_, lean_object* v___y_879_){
_start:
{
lean_object* v_res_880_; 
v_res_880_ = l_List_forIn_x27_loop___at___00CathedralKernelGraph_record_spec__2(v_as_875_, v_as_x27_876_, v_b_877_, v_a_878_);
lean_dec(v_as_x27_876_);
lean_dec(v_as_875_);
return v_res_880_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exportGraph_spec__0(lean_object* v_as_881_, size_t v_sz_882_, size_t v_i_883_, lean_object* v_b_884_){
_start:
{
lean_object* v_a_887_; uint8_t v___x_891_; 
v___x_891_ = lean_usize_dec_lt(v_i_883_, v_sz_882_);
if (v___x_891_ == 0)
{
lean_object* v___x_892_; 
v___x_892_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_892_, 0, v_b_884_);
return v___x_892_;
}
else
{
lean_object* v_fst_893_; lean_object* v_snd_894_; lean_object* v___x_896_; uint8_t v_isShared_897_; uint8_t v_isSharedCheck_908_; 
v_fst_893_ = lean_ctor_get(v_b_884_, 0);
v_snd_894_ = lean_ctor_get(v_b_884_, 1);
v_isSharedCheck_908_ = !lean_is_exclusive(v_b_884_);
if (v_isSharedCheck_908_ == 0)
{
v___x_896_ = v_b_884_;
v_isShared_897_ = v_isSharedCheck_908_;
goto v_resetjp_895_;
}
else
{
lean_inc(v_snd_894_);
lean_inc(v_fst_893_);
lean_dec(v_b_884_);
v___x_896_ = lean_box(0);
v_isShared_897_ = v_isSharedCheck_908_;
goto v_resetjp_895_;
}
v_resetjp_895_:
{
lean_object* v_a_898_; uint8_t v___x_899_; 
v_a_898_ = lean_array_uget_borrowed(v_as_881_, v_i_883_);
v___x_899_ = l_Std_DHashMap_Internal_Raw_u2080_contains___at___00Lean_NameHashSet_contains_spec__0___redArg(v_fst_893_, v_a_898_);
if (v___x_899_ == 0)
{
lean_object* v___x_900_; lean_object* v___x_901_; lean_object* v___x_903_; 
lean_inc_n(v_a_898_, 2);
v___x_900_ = l_Lean_NameHashSet_insert(v_fst_893_, v_a_898_);
v___x_901_ = lean_array_push(v_snd_894_, v_a_898_);
if (v_isShared_897_ == 0)
{
lean_ctor_set(v___x_896_, 1, v___x_901_);
lean_ctor_set(v___x_896_, 0, v___x_900_);
v___x_903_ = v___x_896_;
goto v_reusejp_902_;
}
else
{
lean_object* v_reuseFailAlloc_904_; 
v_reuseFailAlloc_904_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_904_, 0, v___x_900_);
lean_ctor_set(v_reuseFailAlloc_904_, 1, v___x_901_);
v___x_903_ = v_reuseFailAlloc_904_;
goto v_reusejp_902_;
}
v_reusejp_902_:
{
v_a_887_ = v___x_903_;
goto v___jp_886_;
}
}
else
{
lean_object* v___x_906_; 
if (v_isShared_897_ == 0)
{
v___x_906_ = v___x_896_;
goto v_reusejp_905_;
}
else
{
lean_object* v_reuseFailAlloc_907_; 
v_reuseFailAlloc_907_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_907_, 0, v_fst_893_);
lean_ctor_set(v_reuseFailAlloc_907_, 1, v_snd_894_);
v___x_906_ = v_reuseFailAlloc_907_;
goto v_reusejp_905_;
}
v_reusejp_905_:
{
v_a_887_ = v___x_906_;
goto v___jp_886_;
}
}
}
}
v___jp_886_:
{
size_t v___x_888_; size_t v___x_889_; 
v___x_888_ = ((size_t)1ULL);
v___x_889_ = lean_usize_add(v_i_883_, v___x_888_);
v_i_883_ = v___x_889_;
v_b_884_ = v_a_887_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exportGraph_spec__0___boxed(lean_object* v_as_909_, lean_object* v_sz_910_, lean_object* v_i_911_, lean_object* v_b_912_, lean_object* v___y_913_){
_start:
{
size_t v_sz_boxed_914_; size_t v_i_boxed_915_; lean_object* v_res_916_; 
v_sz_boxed_914_ = lean_unbox_usize(v_sz_910_);
lean_dec(v_sz_910_);
v_i_boxed_915_ = lean_unbox_usize(v_i_911_);
lean_dec(v_i_911_);
v_res_916_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exportGraph_spec__0(v_as_909_, v_sz_boxed_914_, v_i_boxed_915_, v_b_912_);
lean_dec_ref(v_as_909_);
return v_res_916_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg(lean_object* v_kenv_923_, lean_object* v_a_924_, lean_object* v_env_925_, lean_object* v_a_926_){
_start:
{
lean_object* v_snd_928_; lean_object* v_snd_929_; lean_object* v_fst_930_; lean_object* v___x_932_; uint8_t v_isShared_933_; uint8_t v_isSharedCheck_1055_; 
v_snd_928_ = lean_ctor_get(v_a_926_, 1);
lean_inc(v_snd_928_);
v_snd_929_ = lean_ctor_get(v_snd_928_, 1);
lean_inc(v_snd_929_);
v_fst_930_ = lean_ctor_get(v_a_926_, 0);
v_isSharedCheck_1055_ = !lean_is_exclusive(v_a_926_);
if (v_isSharedCheck_1055_ == 0)
{
lean_object* v_unused_1056_; 
v_unused_1056_ = lean_ctor_get(v_a_926_, 1);
lean_dec(v_unused_1056_);
v___x_932_ = v_a_926_;
v_isShared_933_ = v_isSharedCheck_1055_;
goto v_resetjp_931_;
}
else
{
lean_inc(v_fst_930_);
lean_dec(v_a_926_);
v___x_932_ = lean_box(0);
v_isShared_933_ = v_isSharedCheck_1055_;
goto v_resetjp_931_;
}
v_resetjp_931_:
{
lean_object* v_fst_934_; lean_object* v___x_936_; uint8_t v_isShared_937_; uint8_t v_isSharedCheck_1053_; 
v_fst_934_ = lean_ctor_get(v_snd_928_, 0);
v_isSharedCheck_1053_ = !lean_is_exclusive(v_snd_928_);
if (v_isSharedCheck_1053_ == 0)
{
lean_object* v_unused_1054_; 
v_unused_1054_ = lean_ctor_get(v_snd_928_, 1);
lean_dec(v_unused_1054_);
v___x_936_ = v_snd_928_;
v_isShared_937_ = v_isSharedCheck_1053_;
goto v_resetjp_935_;
}
else
{
lean_inc(v_fst_934_);
lean_dec(v_snd_928_);
v___x_936_ = lean_box(0);
v_isShared_937_ = v_isSharedCheck_1053_;
goto v_resetjp_935_;
}
v_resetjp_935_:
{
lean_object* v_fst_938_; lean_object* v_snd_939_; lean_object* v___x_941_; uint8_t v_isShared_942_; uint8_t v_isSharedCheck_1052_; 
v_fst_938_ = lean_ctor_get(v_snd_929_, 0);
v_snd_939_ = lean_ctor_get(v_snd_929_, 1);
v_isSharedCheck_1052_ = !lean_is_exclusive(v_snd_929_);
if (v_isSharedCheck_1052_ == 0)
{
v___x_941_ = v_snd_929_;
v_isShared_942_ = v_isSharedCheck_1052_;
goto v_resetjp_940_;
}
else
{
lean_inc(v_snd_939_);
lean_inc(v_fst_938_);
lean_dec(v_snd_929_);
v___x_941_ = lean_box(0);
v_isShared_942_ = v_isSharedCheck_1052_;
goto v_resetjp_940_;
}
v_resetjp_940_:
{
lean_object* v___x_943_; uint8_t v___x_944_; 
v___x_943_ = lean_array_get_size(v_fst_934_);
v___x_944_ = lean_nat_dec_lt(v_fst_938_, v___x_943_);
if (v___x_944_ == 0)
{
lean_object* v___x_946_; 
lean_dec_ref(v_kenv_923_);
if (v_isShared_942_ == 0)
{
v___x_946_ = v___x_941_;
goto v_reusejp_945_;
}
else
{
lean_object* v_reuseFailAlloc_954_; 
v_reuseFailAlloc_954_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_954_, 0, v_fst_938_);
lean_ctor_set(v_reuseFailAlloc_954_, 1, v_snd_939_);
v___x_946_ = v_reuseFailAlloc_954_;
goto v_reusejp_945_;
}
v_reusejp_945_:
{
lean_object* v___x_948_; 
if (v_isShared_937_ == 0)
{
lean_ctor_set(v___x_936_, 1, v___x_946_);
v___x_948_ = v___x_936_;
goto v_reusejp_947_;
}
else
{
lean_object* v_reuseFailAlloc_953_; 
v_reuseFailAlloc_953_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_953_, 0, v_fst_934_);
lean_ctor_set(v_reuseFailAlloc_953_, 1, v___x_946_);
v___x_948_ = v_reuseFailAlloc_953_;
goto v_reusejp_947_;
}
v_reusejp_947_:
{
lean_object* v___x_950_; 
if (v_isShared_933_ == 0)
{
lean_ctor_set(v___x_932_, 1, v___x_948_);
v___x_950_ = v___x_932_;
goto v_reusejp_949_;
}
else
{
lean_object* v_reuseFailAlloc_952_; 
v_reuseFailAlloc_952_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_952_, 0, v_fst_930_);
lean_ctor_set(v_reuseFailAlloc_952_, 1, v___x_948_);
v___x_950_ = v_reuseFailAlloc_952_;
goto v_reusejp_949_;
}
v_reusejp_949_:
{
lean_object* v___x_951_; 
v___x_951_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_951_, 0, v___x_950_);
return v___x_951_;
}
}
}
}
else
{
lean_object* v___x_955_; lean_object* v___x_956_; lean_object* v___x_957_; lean_object* v___x_958_; lean_object* v___x_959_; 
v___x_955_ = lean_box(0);
v___x_956_ = lean_array_get_borrowed(v___x_955_, v_fst_934_, v_fst_938_);
v___x_957_ = lean_unsigned_to_nat(1u);
v___x_958_ = lean_nat_add(v_fst_938_, v___x_957_);
lean_dec(v_fst_938_);
lean_inc(v___x_956_);
lean_inc_ref(v_kenv_923_);
v___x_959_ = lean_environment_find(v_kenv_923_, v___x_956_);
if (lean_obj_tag(v___x_959_) == 0)
{
lean_object* v___x_960_; lean_object* v___x_961_; lean_object* v___x_962_; lean_object* v___x_963_; lean_object* v___x_964_; lean_object* v___x_966_; 
v___x_960_ = lean_box(0);
v___x_961_ = lean_nat_add(v_snd_939_, v___x_957_);
lean_dec(v_snd_939_);
v___x_962_ = ((lean_object*)(l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__2));
v___x_963_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__20));
lean_inc(v___x_956_);
v___x_964_ = l_CathedralKernelGraph_jid(v___x_956_);
if (v_isShared_942_ == 0)
{
lean_ctor_set(v___x_941_, 1, v___x_964_);
lean_ctor_set(v___x_941_, 0, v___x_963_);
v___x_966_ = v___x_941_;
goto v_reusejp_965_;
}
else
{
lean_object* v_reuseFailAlloc_993_; 
v_reuseFailAlloc_993_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_993_, 0, v___x_963_);
lean_ctor_set(v_reuseFailAlloc_993_, 1, v___x_964_);
v___x_966_ = v_reuseFailAlloc_993_;
goto v_reusejp_965_;
}
v_reusejp_965_:
{
lean_object* v___x_967_; lean_object* v___x_968_; lean_object* v___x_969_; lean_object* v___x_971_; 
v___x_967_ = ((lean_object*)(l_CathedralKernelGraph_record___closed__21));
lean_inc(v___x_956_);
v___x_968_ = l_Lean_Name_toStringWithToken___at___00Lean_Name_toString_spec__0(v___x_956_, v___x_944_);
v___x_969_ = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(v___x_969_, 0, v___x_968_);
if (v_isShared_937_ == 0)
{
lean_ctor_set(v___x_936_, 1, v___x_969_);
lean_ctor_set(v___x_936_, 0, v___x_967_);
v___x_971_ = v___x_936_;
goto v_reusejp_970_;
}
else
{
lean_object* v_reuseFailAlloc_992_; 
v_reuseFailAlloc_992_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_992_, 0, v___x_967_);
lean_ctor_set(v_reuseFailAlloc_992_, 1, v___x_969_);
v___x_971_ = v_reuseFailAlloc_992_;
goto v_reusejp_970_;
}
v_reusejp_970_:
{
lean_object* v___x_972_; lean_object* v___x_973_; lean_object* v___x_974_; lean_object* v___x_975_; lean_object* v___x_976_; lean_object* v___x_977_; 
v___x_972_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_972_, 0, v___x_971_);
lean_ctor_set(v___x_972_, 1, v___x_960_);
v___x_973_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_973_, 0, v___x_966_);
lean_ctor_set(v___x_973_, 1, v___x_972_);
v___x_974_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_974_, 0, v___x_962_);
lean_ctor_set(v___x_974_, 1, v___x_973_);
v___x_975_ = l_Lean_Json_mkObj(v___x_974_);
lean_dec_ref_known(v___x_974_, 2);
v___x_976_ = l_Lean_Json_compress(v___x_975_);
v___x_977_ = l_IO_FS_Handle_putStrLn(v_a_924_, v___x_976_);
if (lean_obj_tag(v___x_977_) == 0)
{
lean_object* v___x_979_; 
lean_dec_ref_known(v___x_977_, 1);
if (v_isShared_933_ == 0)
{
lean_ctor_set(v___x_932_, 1, v___x_961_);
lean_ctor_set(v___x_932_, 0, v___x_958_);
v___x_979_ = v___x_932_;
goto v_reusejp_978_;
}
else
{
lean_object* v_reuseFailAlloc_983_; 
v_reuseFailAlloc_983_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_983_, 0, v___x_958_);
lean_ctor_set(v_reuseFailAlloc_983_, 1, v___x_961_);
v___x_979_ = v_reuseFailAlloc_983_;
goto v_reusejp_978_;
}
v_reusejp_978_:
{
lean_object* v___x_980_; lean_object* v___x_981_; 
v___x_980_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_980_, 0, v_fst_934_);
lean_ctor_set(v___x_980_, 1, v___x_979_);
v___x_981_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_981_, 0, v_fst_930_);
lean_ctor_set(v___x_981_, 1, v___x_980_);
v_a_926_ = v___x_981_;
goto _start;
}
}
else
{
lean_object* v_a_984_; lean_object* v___x_986_; uint8_t v_isShared_987_; uint8_t v_isSharedCheck_991_; 
lean_dec(v___x_961_);
lean_dec(v___x_958_);
lean_dec(v_fst_934_);
lean_del_object(v___x_932_);
lean_dec(v_fst_930_);
lean_dec_ref(v_kenv_923_);
v_a_984_ = lean_ctor_get(v___x_977_, 0);
v_isSharedCheck_991_ = !lean_is_exclusive(v___x_977_);
if (v_isSharedCheck_991_ == 0)
{
v___x_986_ = v___x_977_;
v_isShared_987_ = v_isSharedCheck_991_;
goto v_resetjp_985_;
}
else
{
lean_inc(v_a_984_);
lean_dec(v___x_977_);
v___x_986_ = lean_box(0);
v_isShared_987_ = v_isSharedCheck_991_;
goto v_resetjp_985_;
}
v_resetjp_985_:
{
lean_object* v___x_989_; 
if (v_isShared_987_ == 0)
{
v___x_989_ = v___x_986_;
goto v_reusejp_988_;
}
else
{
lean_object* v_reuseFailAlloc_990_; 
v_reuseFailAlloc_990_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_990_, 0, v_a_984_);
v___x_989_ = v_reuseFailAlloc_990_;
goto v_reusejp_988_;
}
v_reusejp_988_:
{
return v___x_989_;
}
}
}
}
}
}
else
{
lean_object* v_val_994_; lean_object* v___x_995_; 
lean_del_object(v___x_932_);
v_val_994_ = lean_ctor_get(v___x_959_, 0);
lean_inc(v_val_994_);
lean_dec_ref_known(v___x_959_, 1);
v___x_995_ = l_CathedralKernelGraph_record(v_env_925_, v_val_994_);
if (lean_obj_tag(v___x_995_) == 0)
{
lean_object* v_a_996_; lean_object* v_fst_997_; lean_object* v_snd_998_; lean_object* v___x_1000_; uint8_t v_isShared_1001_; uint8_t v_isSharedCheck_1043_; 
v_a_996_ = lean_ctor_get(v___x_995_, 0);
lean_inc(v_a_996_);
lean_dec_ref_known(v___x_995_, 1);
v_fst_997_ = lean_ctor_get(v_a_996_, 0);
v_snd_998_ = lean_ctor_get(v_a_996_, 1);
v_isSharedCheck_1043_ = !lean_is_exclusive(v_a_996_);
if (v_isSharedCheck_1043_ == 0)
{
v___x_1000_ = v_a_996_;
v_isShared_1001_ = v_isSharedCheck_1043_;
goto v_resetjp_999_;
}
else
{
lean_inc(v_snd_998_);
lean_inc(v_fst_997_);
lean_dec(v_a_996_);
v___x_1000_ = lean_box(0);
v_isShared_1001_ = v_isSharedCheck_1043_;
goto v_resetjp_999_;
}
v_resetjp_999_:
{
lean_object* v___x_1002_; lean_object* v___x_1003_; 
v___x_1002_ = l_Lean_Json_compress(v_fst_997_);
v___x_1003_ = l_IO_FS_Handle_putStrLn(v_a_924_, v___x_1002_);
if (lean_obj_tag(v___x_1003_) == 0)
{
lean_object* v___x_1005_; 
lean_dec_ref_known(v___x_1003_, 1);
if (v_isShared_1001_ == 0)
{
lean_ctor_set(v___x_1000_, 1, v_fst_934_);
lean_ctor_set(v___x_1000_, 0, v_fst_930_);
v___x_1005_ = v___x_1000_;
goto v_reusejp_1004_;
}
else
{
lean_object* v_reuseFailAlloc_1034_; 
v_reuseFailAlloc_1034_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1034_, 0, v_fst_930_);
lean_ctor_set(v_reuseFailAlloc_1034_, 1, v_fst_934_);
v___x_1005_ = v_reuseFailAlloc_1034_;
goto v_reusejp_1004_;
}
v_reusejp_1004_:
{
size_t v_sz_1006_; size_t v___x_1007_; lean_object* v___x_1008_; 
v_sz_1006_ = lean_array_size(v_snd_998_);
v___x_1007_ = ((size_t)0ULL);
v___x_1008_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exportGraph_spec__0(v_snd_998_, v_sz_1006_, v___x_1007_, v___x_1005_);
lean_dec(v_snd_998_);
if (lean_obj_tag(v___x_1008_) == 0)
{
lean_object* v_a_1009_; lean_object* v_fst_1010_; lean_object* v_snd_1011_; lean_object* v___x_1013_; uint8_t v_isShared_1014_; uint8_t v_isSharedCheck_1025_; 
v_a_1009_ = lean_ctor_get(v___x_1008_, 0);
lean_inc(v_a_1009_);
lean_dec_ref_known(v___x_1008_, 1);
v_fst_1010_ = lean_ctor_get(v_a_1009_, 0);
v_snd_1011_ = lean_ctor_get(v_a_1009_, 1);
v_isSharedCheck_1025_ = !lean_is_exclusive(v_a_1009_);
if (v_isSharedCheck_1025_ == 0)
{
v___x_1013_ = v_a_1009_;
v_isShared_1014_ = v_isSharedCheck_1025_;
goto v_resetjp_1012_;
}
else
{
lean_inc(v_snd_1011_);
lean_inc(v_fst_1010_);
lean_dec(v_a_1009_);
v___x_1013_ = lean_box(0);
v_isShared_1014_ = v_isSharedCheck_1025_;
goto v_resetjp_1012_;
}
v_resetjp_1012_:
{
lean_object* v___x_1016_; 
if (v_isShared_1014_ == 0)
{
lean_ctor_set(v___x_1013_, 1, v_snd_939_);
lean_ctor_set(v___x_1013_, 0, v___x_958_);
v___x_1016_ = v___x_1013_;
goto v_reusejp_1015_;
}
else
{
lean_object* v_reuseFailAlloc_1024_; 
v_reuseFailAlloc_1024_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1024_, 0, v___x_958_);
lean_ctor_set(v_reuseFailAlloc_1024_, 1, v_snd_939_);
v___x_1016_ = v_reuseFailAlloc_1024_;
goto v_reusejp_1015_;
}
v_reusejp_1015_:
{
lean_object* v___x_1018_; 
if (v_isShared_942_ == 0)
{
lean_ctor_set(v___x_941_, 1, v___x_1016_);
lean_ctor_set(v___x_941_, 0, v_snd_1011_);
v___x_1018_ = v___x_941_;
goto v_reusejp_1017_;
}
else
{
lean_object* v_reuseFailAlloc_1023_; 
v_reuseFailAlloc_1023_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1023_, 0, v_snd_1011_);
lean_ctor_set(v_reuseFailAlloc_1023_, 1, v___x_1016_);
v___x_1018_ = v_reuseFailAlloc_1023_;
goto v_reusejp_1017_;
}
v_reusejp_1017_:
{
lean_object* v___x_1020_; 
if (v_isShared_937_ == 0)
{
lean_ctor_set(v___x_936_, 1, v___x_1018_);
lean_ctor_set(v___x_936_, 0, v_fst_1010_);
v___x_1020_ = v___x_936_;
goto v_reusejp_1019_;
}
else
{
lean_object* v_reuseFailAlloc_1022_; 
v_reuseFailAlloc_1022_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1022_, 0, v_fst_1010_);
lean_ctor_set(v_reuseFailAlloc_1022_, 1, v___x_1018_);
v___x_1020_ = v_reuseFailAlloc_1022_;
goto v_reusejp_1019_;
}
v_reusejp_1019_:
{
v_a_926_ = v___x_1020_;
goto _start;
}
}
}
}
}
else
{
lean_object* v_a_1026_; lean_object* v___x_1028_; uint8_t v_isShared_1029_; uint8_t v_isSharedCheck_1033_; 
lean_dec(v___x_958_);
lean_del_object(v___x_941_);
lean_dec(v_snd_939_);
lean_del_object(v___x_936_);
lean_dec_ref(v_kenv_923_);
v_a_1026_ = lean_ctor_get(v___x_1008_, 0);
v_isSharedCheck_1033_ = !lean_is_exclusive(v___x_1008_);
if (v_isSharedCheck_1033_ == 0)
{
v___x_1028_ = v___x_1008_;
v_isShared_1029_ = v_isSharedCheck_1033_;
goto v_resetjp_1027_;
}
else
{
lean_inc(v_a_1026_);
lean_dec(v___x_1008_);
v___x_1028_ = lean_box(0);
v_isShared_1029_ = v_isSharedCheck_1033_;
goto v_resetjp_1027_;
}
v_resetjp_1027_:
{
lean_object* v___x_1031_; 
if (v_isShared_1029_ == 0)
{
v___x_1031_ = v___x_1028_;
goto v_reusejp_1030_;
}
else
{
lean_object* v_reuseFailAlloc_1032_; 
v_reuseFailAlloc_1032_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1032_, 0, v_a_1026_);
v___x_1031_ = v_reuseFailAlloc_1032_;
goto v_reusejp_1030_;
}
v_reusejp_1030_:
{
return v___x_1031_;
}
}
}
}
}
else
{
lean_object* v_a_1035_; lean_object* v___x_1037_; uint8_t v_isShared_1038_; uint8_t v_isSharedCheck_1042_; 
lean_del_object(v___x_1000_);
lean_dec(v_snd_998_);
lean_dec(v___x_958_);
lean_del_object(v___x_941_);
lean_dec(v_snd_939_);
lean_del_object(v___x_936_);
lean_dec(v_fst_934_);
lean_dec(v_fst_930_);
lean_dec_ref(v_kenv_923_);
v_a_1035_ = lean_ctor_get(v___x_1003_, 0);
v_isSharedCheck_1042_ = !lean_is_exclusive(v___x_1003_);
if (v_isSharedCheck_1042_ == 0)
{
v___x_1037_ = v___x_1003_;
v_isShared_1038_ = v_isSharedCheck_1042_;
goto v_resetjp_1036_;
}
else
{
lean_inc(v_a_1035_);
lean_dec(v___x_1003_);
v___x_1037_ = lean_box(0);
v_isShared_1038_ = v_isSharedCheck_1042_;
goto v_resetjp_1036_;
}
v_resetjp_1036_:
{
lean_object* v___x_1040_; 
if (v_isShared_1038_ == 0)
{
v___x_1040_ = v___x_1037_;
goto v_reusejp_1039_;
}
else
{
lean_object* v_reuseFailAlloc_1041_; 
v_reuseFailAlloc_1041_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1041_, 0, v_a_1035_);
v___x_1040_ = v_reuseFailAlloc_1041_;
goto v_reusejp_1039_;
}
v_reusejp_1039_:
{
return v___x_1040_;
}
}
}
}
}
else
{
lean_object* v_a_1044_; lean_object* v___x_1046_; uint8_t v_isShared_1047_; uint8_t v_isSharedCheck_1051_; 
lean_dec(v___x_958_);
lean_del_object(v___x_941_);
lean_dec(v_snd_939_);
lean_del_object(v___x_936_);
lean_dec(v_fst_934_);
lean_dec(v_fst_930_);
lean_dec_ref(v_kenv_923_);
v_a_1044_ = lean_ctor_get(v___x_995_, 0);
v_isSharedCheck_1051_ = !lean_is_exclusive(v___x_995_);
if (v_isSharedCheck_1051_ == 0)
{
v___x_1046_ = v___x_995_;
v_isShared_1047_ = v_isSharedCheck_1051_;
goto v_resetjp_1045_;
}
else
{
lean_inc(v_a_1044_);
lean_dec(v___x_995_);
v___x_1046_ = lean_box(0);
v_isShared_1047_ = v_isSharedCheck_1051_;
goto v_resetjp_1045_;
}
v_resetjp_1045_:
{
lean_object* v___x_1049_; 
if (v_isShared_1047_ == 0)
{
v___x_1049_ = v___x_1046_;
goto v_reusejp_1048_;
}
else
{
lean_object* v_reuseFailAlloc_1050_; 
v_reuseFailAlloc_1050_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1050_, 0, v_a_1044_);
v___x_1049_ = v_reuseFailAlloc_1050_;
goto v_reusejp_1048_;
}
v_reusejp_1048_:
{
return v___x_1049_;
}
}
}
}
}
}
}
}
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___boxed(lean_object* v_kenv_1057_, lean_object* v_a_1058_, lean_object* v_env_1059_, lean_object* v_a_1060_, lean_object* v___y_1061_){
_start:
{
lean_object* v_res_1062_; 
v_res_1062_ = l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg(v_kenv_1057_, v_a_1058_, v_env_1059_, v_a_1060_);
lean_dec_ref(v_env_1059_);
lean_dec(v_a_1058_);
return v_res_1062_;
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exportGraph(lean_object* v_env_1087_, lean_object* v_roots_1088_, lean_object* v_axiomRows_1089_, lean_object* v_output_1090_){
_start:
{
lean_object* v_kenv_1092_; uint8_t v___x_1093_; lean_object* v___x_1094_; 
lean_inc_ref(v_env_1087_);
v_kenv_1092_ = lean_elab_environment_to_kernel_env(v_env_1087_);
v___x_1093_ = 1;
v___x_1094_ = lean_io_prim_handle_mk(v_output_1090_, v___x_1093_);
if (lean_obj_tag(v___x_1094_) == 0)
{
lean_object* v_a_1095_; lean_object* v___x_1096_; lean_object* v___x_1097_; lean_object* v___x_1098_; lean_object* v___x_1099_; lean_object* v___x_1100_; lean_object* v___x_1101_; lean_object* v___x_1102_; lean_object* v___x_1103_; lean_object* v___x_1104_; lean_object* v___x_1105_; lean_object* v___x_1106_; lean_object* v___x_1107_; lean_object* v___x_1108_; lean_object* v___x_1109_; lean_object* v___x_1110_; lean_object* v___x_1111_; 
v_a_1095_ = lean_ctor_get(v___x_1094_, 0);
lean_inc(v_a_1095_);
lean_dec_ref_known(v___x_1094_, 1);
v___x_1096_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__2));
v___x_1097_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__6));
v___x_1098_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__7));
lean_inc_ref(v_roots_1088_);
v___x_1099_ = l_CathedralKernelGraph_jnames(v_roots_1088_);
v___x_1100_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1100_, 0, v___x_1098_);
lean_ctor_set(v___x_1100_, 1, v___x_1099_);
v___x_1101_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__8));
v___x_1102_ = lean_alloc_ctor(4, 1, 0);
lean_ctor_set(v___x_1102_, 0, v_axiomRows_1089_);
v___x_1103_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1103_, 0, v___x_1101_);
lean_ctor_set(v___x_1103_, 1, v___x_1102_);
v___x_1104_ = lean_box(0);
v___x_1105_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1105_, 0, v___x_1103_);
lean_ctor_set(v___x_1105_, 1, v___x_1104_);
v___x_1106_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1106_, 0, v___x_1100_);
lean_ctor_set(v___x_1106_, 1, v___x_1105_);
v___x_1107_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1107_, 0, v___x_1097_);
lean_ctor_set(v___x_1107_, 1, v___x_1106_);
v___x_1108_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1108_, 0, v___x_1096_);
lean_ctor_set(v___x_1108_, 1, v___x_1107_);
v___x_1109_ = l_Lean_Json_mkObj(v___x_1108_);
lean_dec_ref_known(v___x_1108_, 2);
v___x_1110_ = l_Lean_Json_compress(v___x_1109_);
v___x_1111_ = l_IO_FS_Handle_putStrLn(v_a_1095_, v___x_1110_);
if (lean_obj_tag(v___x_1111_) == 0)
{
lean_object* v___x_1113_; uint8_t v_isShared_1114_; uint8_t v_isSharedCheck_1183_; 
v_isSharedCheck_1183_ = !lean_is_exclusive(v___x_1111_);
if (v_isSharedCheck_1183_ == 0)
{
lean_object* v_unused_1184_; 
v_unused_1184_ = lean_ctor_get(v___x_1111_, 0);
lean_dec(v_unused_1184_);
v___x_1113_ = v___x_1111_;
v_isShared_1114_ = v_isSharedCheck_1183_;
goto v_resetjp_1112_;
}
else
{
lean_dec(v___x_1111_);
v___x_1113_ = lean_box(0);
v_isShared_1114_ = v_isSharedCheck_1183_;
goto v_resetjp_1112_;
}
v_resetjp_1112_:
{
lean_object* v___x_1115_; size_t v_sz_1116_; size_t v___x_1117_; lean_object* v___x_1118_; 
v___x_1115_ = lean_obj_once(&l_CathedralKernelGraph_exprRefs___closed__4, &l_CathedralKernelGraph_exprRefs___closed__4_once, _init_l_CathedralKernelGraph_exprRefs___closed__4);
v_sz_1116_ = lean_array_size(v_roots_1088_);
v___x_1117_ = ((size_t)0ULL);
v___x_1118_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00CathedralKernelGraph_exprRefs_spec__0(v_roots_1088_, v_sz_1116_, v___x_1117_, v___x_1115_);
if (lean_obj_tag(v___x_1118_) == 0)
{
lean_object* v_a_1119_; lean_object* v___x_1120_; lean_object* v___x_1121_; lean_object* v___x_1122_; lean_object* v___x_1123_; 
v_a_1119_ = lean_ctor_get(v___x_1118_, 0);
lean_inc(v_a_1119_);
lean_dec_ref_known(v___x_1118_, 1);
v___x_1120_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__9));
v___x_1121_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1121_, 0, v_roots_1088_);
lean_ctor_set(v___x_1121_, 1, v___x_1120_);
v___x_1122_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1122_, 0, v_a_1119_);
lean_ctor_set(v___x_1122_, 1, v___x_1121_);
v___x_1123_ = l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg(v_kenv_1092_, v_a_1095_, v_env_1087_, v___x_1122_);
lean_dec_ref(v_env_1087_);
if (lean_obj_tag(v___x_1123_) == 0)
{
lean_object* v_a_1124_; lean_object* v_snd_1125_; lean_object* v___x_1127_; uint8_t v_isShared_1128_; uint8_t v_isSharedCheck_1165_; 
v_a_1124_ = lean_ctor_get(v___x_1123_, 0);
lean_inc(v_a_1124_);
lean_dec_ref_known(v___x_1123_, 1);
v_snd_1125_ = lean_ctor_get(v_a_1124_, 1);
v_isSharedCheck_1165_ = !lean_is_exclusive(v_a_1124_);
if (v_isSharedCheck_1165_ == 0)
{
lean_object* v_unused_1166_; 
v_unused_1166_ = lean_ctor_get(v_a_1124_, 0);
lean_dec(v_unused_1166_);
v___x_1127_ = v_a_1124_;
v_isShared_1128_ = v_isSharedCheck_1165_;
goto v_resetjp_1126_;
}
else
{
lean_inc(v_snd_1125_);
lean_dec(v_a_1124_);
v___x_1127_ = lean_box(0);
v_isShared_1128_ = v_isSharedCheck_1165_;
goto v_resetjp_1126_;
}
v_resetjp_1126_:
{
lean_object* v_snd_1129_; lean_object* v_fst_1130_; lean_object* v___x_1132_; uint8_t v_isShared_1133_; uint8_t v_isSharedCheck_1164_; 
v_snd_1129_ = lean_ctor_get(v_snd_1125_, 1);
v_fst_1130_ = lean_ctor_get(v_snd_1125_, 0);
v_isSharedCheck_1164_ = !lean_is_exclusive(v_snd_1125_);
if (v_isSharedCheck_1164_ == 0)
{
v___x_1132_ = v_snd_1125_;
v_isShared_1133_ = v_isSharedCheck_1164_;
goto v_resetjp_1131_;
}
else
{
lean_inc(v_snd_1129_);
lean_inc(v_fst_1130_);
lean_dec(v_snd_1125_);
v___x_1132_ = lean_box(0);
v_isShared_1133_ = v_isSharedCheck_1164_;
goto v_resetjp_1131_;
}
v_resetjp_1131_:
{
lean_object* v_snd_1134_; lean_object* v___x_1136_; uint8_t v_isShared_1137_; uint8_t v_isSharedCheck_1162_; 
v_snd_1134_ = lean_ctor_get(v_snd_1129_, 1);
v_isSharedCheck_1162_ = !lean_is_exclusive(v_snd_1129_);
if (v_isSharedCheck_1162_ == 0)
{
lean_object* v_unused_1163_; 
v_unused_1163_ = lean_ctor_get(v_snd_1129_, 0);
lean_dec(v_unused_1163_);
v___x_1136_ = v_snd_1129_;
v_isShared_1137_ = v_isSharedCheck_1162_;
goto v_resetjp_1135_;
}
else
{
lean_inc(v_snd_1134_);
lean_dec(v_snd_1129_);
v___x_1136_ = lean_box(0);
v_isShared_1137_ = v_isSharedCheck_1162_;
goto v_resetjp_1135_;
}
v_resetjp_1135_:
{
lean_object* v___x_1138_; lean_object* v___x_1139_; lean_object* v___x_1140_; lean_object* v___x_1141_; lean_object* v___x_1143_; 
v___x_1138_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__12));
v___x_1139_ = ((lean_object*)(l_CathedralKernelGraph_exportGraph___closed__13));
v___x_1140_ = lean_array_get_size(v_fst_1130_);
lean_dec(v_fst_1130_);
v___x_1141_ = l_Lean_JsonNumber_fromNat(v___x_1140_);
if (v_isShared_1114_ == 0)
{
lean_ctor_set_tag(v___x_1113_, 2);
lean_ctor_set(v___x_1113_, 0, v___x_1141_);
v___x_1143_ = v___x_1113_;
goto v_reusejp_1142_;
}
else
{
lean_object* v_reuseFailAlloc_1161_; 
v_reuseFailAlloc_1161_ = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1161_, 0, v___x_1141_);
v___x_1143_ = v_reuseFailAlloc_1161_;
goto v_reusejp_1142_;
}
v_reusejp_1142_:
{
lean_object* v___x_1145_; 
if (v_isShared_1137_ == 0)
{
lean_ctor_set(v___x_1136_, 1, v___x_1143_);
lean_ctor_set(v___x_1136_, 0, v___x_1139_);
v___x_1145_ = v___x_1136_;
goto v_reusejp_1144_;
}
else
{
lean_object* v_reuseFailAlloc_1160_; 
v_reuseFailAlloc_1160_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1160_, 0, v___x_1139_);
lean_ctor_set(v_reuseFailAlloc_1160_, 1, v___x_1143_);
v___x_1145_ = v_reuseFailAlloc_1160_;
goto v_reusejp_1144_;
}
v_reusejp_1144_:
{
lean_object* v___x_1146_; lean_object* v___x_1147_; lean_object* v___x_1148_; lean_object* v___x_1150_; 
v___x_1146_ = ((lean_object*)(l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg___closed__0));
v___x_1147_ = l_Lean_JsonNumber_fromNat(v_snd_1134_);
v___x_1148_ = lean_alloc_ctor(2, 1, 0);
lean_ctor_set(v___x_1148_, 0, v___x_1147_);
if (v_isShared_1133_ == 0)
{
lean_ctor_set(v___x_1132_, 1, v___x_1148_);
lean_ctor_set(v___x_1132_, 0, v___x_1146_);
v___x_1150_ = v___x_1132_;
goto v_reusejp_1149_;
}
else
{
lean_object* v_reuseFailAlloc_1159_; 
v_reuseFailAlloc_1159_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1159_, 0, v___x_1146_);
lean_ctor_set(v_reuseFailAlloc_1159_, 1, v___x_1148_);
v___x_1150_ = v_reuseFailAlloc_1159_;
goto v_reusejp_1149_;
}
v_reusejp_1149_:
{
lean_object* v___x_1152_; 
if (v_isShared_1128_ == 0)
{
lean_ctor_set_tag(v___x_1127_, 1);
lean_ctor_set(v___x_1127_, 1, v___x_1104_);
lean_ctor_set(v___x_1127_, 0, v___x_1150_);
v___x_1152_ = v___x_1127_;
goto v_reusejp_1151_;
}
else
{
lean_object* v_reuseFailAlloc_1158_; 
v_reuseFailAlloc_1158_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v_reuseFailAlloc_1158_, 0, v___x_1150_);
lean_ctor_set(v_reuseFailAlloc_1158_, 1, v___x_1104_);
v___x_1152_ = v_reuseFailAlloc_1158_;
goto v_reusejp_1151_;
}
v_reusejp_1151_:
{
lean_object* v___x_1153_; lean_object* v___x_1154_; lean_object* v___x_1155_; lean_object* v___x_1156_; lean_object* v___x_1157_; 
v___x_1153_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1153_, 0, v___x_1145_);
lean_ctor_set(v___x_1153_, 1, v___x_1152_);
v___x_1154_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1154_, 0, v___x_1138_);
lean_ctor_set(v___x_1154_, 1, v___x_1153_);
v___x_1155_ = l_Lean_Json_mkObj(v___x_1154_);
lean_dec_ref_known(v___x_1154_, 2);
v___x_1156_ = l_Lean_Json_compress(v___x_1155_);
v___x_1157_ = l_IO_FS_Handle_putStrLn(v_a_1095_, v___x_1156_);
lean_dec(v_a_1095_);
return v___x_1157_;
}
}
}
}
}
}
}
}
else
{
lean_object* v_a_1167_; lean_object* v___x_1169_; uint8_t v_isShared_1170_; uint8_t v_isSharedCheck_1174_; 
lean_del_object(v___x_1113_);
lean_dec(v_a_1095_);
v_a_1167_ = lean_ctor_get(v___x_1123_, 0);
v_isSharedCheck_1174_ = !lean_is_exclusive(v___x_1123_);
if (v_isSharedCheck_1174_ == 0)
{
v___x_1169_ = v___x_1123_;
v_isShared_1170_ = v_isSharedCheck_1174_;
goto v_resetjp_1168_;
}
else
{
lean_inc(v_a_1167_);
lean_dec(v___x_1123_);
v___x_1169_ = lean_box(0);
v_isShared_1170_ = v_isSharedCheck_1174_;
goto v_resetjp_1168_;
}
v_resetjp_1168_:
{
lean_object* v___x_1172_; 
if (v_isShared_1170_ == 0)
{
v___x_1172_ = v___x_1169_;
goto v_reusejp_1171_;
}
else
{
lean_object* v_reuseFailAlloc_1173_; 
v_reuseFailAlloc_1173_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1173_, 0, v_a_1167_);
v___x_1172_ = v_reuseFailAlloc_1173_;
goto v_reusejp_1171_;
}
v_reusejp_1171_:
{
return v___x_1172_;
}
}
}
}
else
{
lean_object* v_a_1175_; lean_object* v___x_1177_; uint8_t v_isShared_1178_; uint8_t v_isSharedCheck_1182_; 
lean_del_object(v___x_1113_);
lean_dec(v_a_1095_);
lean_dec_ref(v_kenv_1092_);
lean_dec_ref(v_roots_1088_);
lean_dec_ref(v_env_1087_);
v_a_1175_ = lean_ctor_get(v___x_1118_, 0);
v_isSharedCheck_1182_ = !lean_is_exclusive(v___x_1118_);
if (v_isSharedCheck_1182_ == 0)
{
v___x_1177_ = v___x_1118_;
v_isShared_1178_ = v_isSharedCheck_1182_;
goto v_resetjp_1176_;
}
else
{
lean_inc(v_a_1175_);
lean_dec(v___x_1118_);
v___x_1177_ = lean_box(0);
v_isShared_1178_ = v_isSharedCheck_1182_;
goto v_resetjp_1176_;
}
v_resetjp_1176_:
{
lean_object* v___x_1180_; 
if (v_isShared_1178_ == 0)
{
v___x_1180_ = v___x_1177_;
goto v_reusejp_1179_;
}
else
{
lean_object* v_reuseFailAlloc_1181_; 
v_reuseFailAlloc_1181_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1181_, 0, v_a_1175_);
v___x_1180_ = v_reuseFailAlloc_1181_;
goto v_reusejp_1179_;
}
v_reusejp_1179_:
{
return v___x_1180_;
}
}
}
}
}
else
{
lean_dec(v_a_1095_);
lean_dec_ref(v_kenv_1092_);
lean_dec_ref(v_roots_1088_);
lean_dec_ref(v_env_1087_);
return v___x_1111_;
}
}
else
{
lean_object* v_a_1185_; lean_object* v___x_1187_; uint8_t v_isShared_1188_; uint8_t v_isSharedCheck_1192_; 
lean_dec_ref(v_kenv_1092_);
lean_dec_ref(v_axiomRows_1089_);
lean_dec_ref(v_roots_1088_);
lean_dec_ref(v_env_1087_);
v_a_1185_ = lean_ctor_get(v___x_1094_, 0);
v_isSharedCheck_1192_ = !lean_is_exclusive(v___x_1094_);
if (v_isSharedCheck_1192_ == 0)
{
v___x_1187_ = v___x_1094_;
v_isShared_1188_ = v_isSharedCheck_1192_;
goto v_resetjp_1186_;
}
else
{
lean_inc(v_a_1185_);
lean_dec(v___x_1094_);
v___x_1187_ = lean_box(0);
v_isShared_1188_ = v_isSharedCheck_1192_;
goto v_resetjp_1186_;
}
v_resetjp_1186_:
{
lean_object* v___x_1190_; 
if (v_isShared_1188_ == 0)
{
v___x_1190_ = v___x_1187_;
goto v_reusejp_1189_;
}
else
{
lean_object* v_reuseFailAlloc_1191_; 
v_reuseFailAlloc_1191_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1191_, 0, v_a_1185_);
v___x_1190_ = v_reuseFailAlloc_1191_;
goto v_reusejp_1189_;
}
v_reusejp_1189_:
{
return v___x_1190_;
}
}
}
}
}
LEAN_EXPORT lean_object* l_CathedralKernelGraph_exportGraph___boxed(lean_object* v_env_1193_, lean_object* v_roots_1194_, lean_object* v_axiomRows_1195_, lean_object* v_output_1196_, lean_object* v_a_1197_){
_start:
{
lean_object* v_res_1198_; 
v_res_1198_ = l_CathedralKernelGraph_exportGraph(v_env_1193_, v_roots_1194_, v_axiomRows_1195_, v_output_1196_);
lean_dec_ref(v_output_1196_);
return v_res_1198_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1(lean_object* v_kenv_1199_, lean_object* v_a_1200_, lean_object* v_env_1201_, lean_object* v_inst_1202_, lean_object* v_a_1203_){
_start:
{
lean_object* v___x_1205_; 
v___x_1205_ = l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___redArg(v_kenv_1199_, v_a_1200_, v_env_1201_, v_a_1203_);
return v___x_1205_;
}
}
LEAN_EXPORT lean_object* l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1___boxed(lean_object* v_kenv_1206_, lean_object* v_a_1207_, lean_object* v_env_1208_, lean_object* v_inst_1209_, lean_object* v_a_1210_, lean_object* v___y_1211_){
_start:
{
lean_object* v_res_1212_; 
v_res_1212_ = l___private_Init_While_0__repeatM_erased___at___00CathedralKernelGraph_exportGraph_spec__1(v_kenv_1206_, v_a_1207_, v_env_1208_, v_inst_1209_, v_a_1210_);
lean_dec_ref(v_env_1208_);
lean_dec(v_a_1207_);
return v_res_1212_;
}
}
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1___redArg(lean_object* v_constName_1213_, lean_object* v___y_1214_){
_start:
{
lean_object* v___x_1216_; lean_object* v___x_1217_; lean_object* v_env_1218_; uint8_t v___x_1219_; lean_object* v_privateEnv_1220_; lean_object* v___x_1221_; lean_object* v___x_1222_; lean_object* v___x_1223_; lean_object* v_s_1224_; lean_object* v___x_1225_; lean_object* v___x_1226_; lean_object* v___x_1227_; lean_object* v___x_1228_; 
v___x_1216_ = l___private_Lean_Util_CollectAxioms_0__Lean_instInhabitedExportedAxiomsState;
v___x_1217_ = lean_st_ref_get(v___y_1214_);
v_env_1218_ = lean_ctor_get(v___x_1217_, 0);
lean_inc_ref_n(v_env_1218_, 2);
lean_dec(v___x_1217_);
v___x_1219_ = 0;
v_privateEnv_1220_ = l_Lean_Environment_setExporting(v_env_1218_, v___x_1219_);
v___x_1221_ = l___private_Lean_Util_CollectAxioms_0__Lean_exportedAxiomsExt;
v___x_1222_ = lean_box(2);
v___x_1223_ = lean_box(0);
v_s_1224_ = l_Lean_PersistentEnvExtension_getState___redArg(v___x_1216_, v___x_1221_, v_env_1218_, v___x_1222_, v___x_1223_);
v___x_1225_ = lean_alloc_closure((void*)(l___private_Lean_Util_CollectAxioms_0__Lean_ExportedAxiomsState_find_x3f___boxed), 3, 1);
lean_closure_set(v___x_1225_, 0, v_s_1224_);
v___x_1226_ = lean_alloc_closure((void*)(l___private_Lean_Util_CollectAxioms_0__Lean_CollectAxioms_collectAndGet___boxed), 4, 2);
lean_closure_set(v___x_1226_, 0, v___x_1225_);
lean_closure_set(v___x_1226_, 1, v_constName_1213_);
v___x_1227_ = l___private_Lean_Util_CollectAxioms_0__Lean_CollectAxioms_runM___redArg(v_privateEnv_1220_, v___x_1226_);
v___x_1228_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_1228_, 0, v___x_1227_);
return v___x_1228_;
}
}
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1___redArg___boxed(lean_object* v_constName_1229_, lean_object* v___y_1230_, lean_object* v___y_1231_){
_start:
{
lean_object* v_res_1232_; 
v_res_1232_ = l_Lean_collectAxioms___at___00main_spec__1___redArg(v_constName_1229_, v___y_1230_);
lean_dec(v___y_1230_);
return v_res_1232_;
}
}
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1(lean_object* v_constName_1233_, lean_object* v___y_1234_, lean_object* v___y_1235_){
_start:
{
lean_object* v___x_1237_; 
v___x_1237_ = l_Lean_collectAxioms___at___00main_spec__1___redArg(v_constName_1233_, v___y_1235_);
return v___x_1237_;
}
}
LEAN_EXPORT lean_object* l_Lean_collectAxioms___at___00main_spec__1___boxed(lean_object* v_constName_1238_, lean_object* v___y_1239_, lean_object* v___y_1240_, lean_object* v___y_1241_){
_start:
{
lean_object* v_res_1242_; 
v_res_1242_ = l_Lean_collectAxioms___at___00main_spec__1(v_constName_1238_, v___y_1239_, v___y_1240_);
lean_dec(v___y_1240_);
lean_dec_ref(v___y_1239_);
return v_res_1242_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0(size_t v_sz_1244_, size_t v_i_1245_, lean_object* v_bs_1246_){
_start:
{
uint8_t v___x_1247_; 
v___x_1247_ = lean_usize_dec_lt(v_i_1245_, v_sz_1244_);
if (v___x_1247_ == 0)
{
return v_bs_1246_;
}
else
{
lean_object* v_v_1248_; lean_object* v___x_1249_; lean_object* v_bs_x27_1250_; lean_object* v___x_1251_; lean_object* v___x_1252_; lean_object* v___x_1253_; lean_object* v___x_1254_; lean_object* v___x_1255_; size_t v___x_1256_; size_t v___x_1257_; lean_object* v___x_1258_; 
v_v_1248_ = lean_array_uget(v_bs_1246_, v_i_1245_);
v___x_1249_ = lean_unsigned_to_nat(0u);
v_bs_x27_1250_ = lean_array_uset(v_bs_1246_, v_i_1245_, v___x_1249_);
v___x_1251_ = lean_box(0);
v___x_1252_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___closed__0));
v___x_1253_ = lean_box(0);
v___x_1254_ = l_String_splitOnAux(v_v_1248_, v___x_1252_, v___x_1249_, v___x_1249_, v___x_1249_, v___x_1253_);
lean_dec(v_v_1248_);
v___x_1255_ = l_List_foldl___at___00Lean_moduleNameOfFileName_spec__0(v___x_1251_, v___x_1254_);
v___x_1256_ = ((size_t)1ULL);
v___x_1257_ = lean_usize_add(v_i_1245_, v___x_1256_);
v___x_1258_ = lean_array_uset(v_bs_x27_1250_, v_i_1245_, v___x_1255_);
v_i_1245_ = v___x_1257_;
v_bs_1246_ = v___x_1258_;
goto _start;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___boxed(lean_object* v_sz_1260_, lean_object* v_i_1261_, lean_object* v_bs_1262_){
_start:
{
size_t v_sz_boxed_1263_; size_t v_i_boxed_1264_; lean_object* v_res_1265_; 
v_sz_boxed_1263_ = lean_unbox_usize(v_sz_1260_);
lean_dec(v_sz_1260_);
v_i_boxed_1264_ = lean_unbox_usize(v_i_1261_);
lean_dec(v_i_1261_);
v_res_1265_ = l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0(v_sz_boxed_1263_, v_i_boxed_1264_, v_bs_1262_);
return v_res_1265_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0(size_t v_sz_1266_, size_t v_i_1267_, lean_object* v_bs_1268_){
_start:
{
uint8_t v___x_1269_; 
v___x_1269_ = lean_usize_dec_lt(v_i_1267_, v_sz_1266_);
if (v___x_1269_ == 0)
{
return v_bs_1268_;
}
else
{
lean_object* v_v_1270_; lean_object* v___x_1271_; lean_object* v_bs_x27_1272_; lean_object* v___x_1273_; lean_object* v___x_1274_; lean_object* v___x_1275_; lean_object* v___x_1276_; lean_object* v___x_1277_; size_t v___x_1278_; size_t v___x_1279_; lean_object* v___x_1280_; lean_object* v___x_1281_; 
v_v_1270_ = lean_array_uget(v_bs_1268_, v_i_1267_);
v___x_1271_ = lean_unsigned_to_nat(0u);
v_bs_x27_1272_ = lean_array_uset(v_bs_1268_, v_i_1267_, v___x_1271_);
v___x_1273_ = lean_box(0);
v___x_1274_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___closed__0));
v___x_1275_ = lean_box(0);
v___x_1276_ = l_String_splitOnAux(v_v_1270_, v___x_1274_, v___x_1271_, v___x_1271_, v___x_1271_, v___x_1275_);
lean_dec(v_v_1270_);
v___x_1277_ = l_List_foldl___at___00Lean_moduleNameOfFileName_spec__0(v___x_1273_, v___x_1276_);
v___x_1278_ = ((size_t)1ULL);
v___x_1279_ = lean_usize_add(v_i_1267_, v___x_1278_);
v___x_1280_ = lean_array_uset(v_bs_x27_1272_, v_i_1267_, v___x_1277_);
v___x_1281_ = l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0(v_sz_1266_, v___x_1279_, v___x_1280_);
return v___x_1281_;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0___boxed(lean_object* v_sz_1282_, lean_object* v_i_1283_, lean_object* v_bs_1284_){
_start:
{
size_t v_sz_boxed_1285_; size_t v_i_boxed_1286_; lean_object* v_res_1287_; 
v_sz_boxed_1285_ = lean_unbox_usize(v_sz_1282_);
lean_dec(v_sz_1282_);
v_i_boxed_1286_ = lean_unbox_usize(v_i_1283_);
lean_dec(v_i_1283_);
v_res_1287_ = l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0(v_sz_boxed_1285_, v_i_boxed_1286_, v_bs_1284_);
return v_res_1287_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3(lean_object* v_as_1288_, size_t v_i_1289_, size_t v_stop_1290_, lean_object* v_b_1291_){
_start:
{
uint8_t v___x_1292_; 
v___x_1292_ = lean_usize_dec_eq(v_i_1289_, v_stop_1290_);
if (v___x_1292_ == 0)
{
lean_object* v___x_1293_; lean_object* v___x_1294_; size_t v___x_1295_; size_t v___x_1296_; 
v___x_1293_ = lean_array_uget_borrowed(v_as_1288_, v_i_1289_);
lean_inc(v___x_1293_);
v___x_1294_ = l_Lean_NameHashSet_insert(v_b_1291_, v___x_1293_);
v___x_1295_ = ((size_t)1ULL);
v___x_1296_ = lean_usize_add(v_i_1289_, v___x_1295_);
v_i_1289_ = v___x_1296_;
v_b_1291_ = v___x_1294_;
goto _start;
}
else
{
return v_b_1291_;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3___boxed(lean_object* v_as_1298_, lean_object* v_i_1299_, lean_object* v_stop_1300_, lean_object* v_b_1301_){
_start:
{
size_t v_i_boxed_1302_; size_t v_stop_boxed_1303_; lean_object* v_res_1304_; 
v_i_boxed_1302_ = lean_unbox_usize(v_i_1299_);
lean_dec(v_i_1299_);
v_stop_boxed_1303_ = lean_unbox_usize(v_stop_1300_);
lean_dec(v_stop_1300_);
v_res_1304_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3(v_as_1298_, v_i_boxed_1302_, v_stop_boxed_1303_, v_b_1301_);
lean_dec_ref(v_as_1298_);
return v_res_1304_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__5(void){
_start:
{
lean_object* v___x_1316_; lean_object* v___x_1317_; lean_object* v___x_1318_; 
v___x_1316_ = lean_unsigned_to_nat(32u);
v___x_1317_ = lean_mk_empty_array_with_capacity(v___x_1316_);
v___x_1318_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_1318_, 0, v___x_1317_);
return v___x_1318_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6(void){
_start:
{
size_t v___x_1319_; lean_object* v___x_1320_; lean_object* v___x_1321_; lean_object* v___x_1322_; lean_object* v___x_1323_; lean_object* v___x_1324_; 
v___x_1319_ = ((size_t)5ULL);
v___x_1320_ = lean_unsigned_to_nat(0u);
v___x_1321_ = lean_unsigned_to_nat(32u);
v___x_1322_ = lean_mk_empty_array_with_capacity(v___x_1321_);
v___x_1323_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__5, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__5_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__5);
v___x_1324_ = lean_alloc_ctor(0, 4, sizeof(size_t)*1);
lean_ctor_set(v___x_1324_, 0, v___x_1323_);
lean_ctor_set(v___x_1324_, 1, v___x_1322_);
lean_ctor_set(v___x_1324_, 2, v___x_1320_);
lean_ctor_set(v___x_1324_, 3, v___x_1320_);
lean_ctor_set_usize(v___x_1324_, 4, v___x_1319_);
return v___x_1324_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__7(void){
_start:
{
lean_object* v___x_1325_; uint64_t v___x_1326_; lean_object* v___x_1327_; 
v___x_1325_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6);
v___x_1326_ = 0ULL;
v___x_1327_ = lean_alloc_ctor(0, 1, 8);
lean_ctor_set(v___x_1327_, 0, v___x_1325_);
lean_ctor_set_uint64(v___x_1327_, sizeof(void*)*1, v___x_1326_);
return v___x_1327_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__8(void){
_start:
{
lean_object* v___x_1328_; 
v___x_1328_ = l_Lean_PersistentHashMap_mkEmptyEntriesArray___redArg();
return v___x_1328_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9(void){
_start:
{
lean_object* v___x_1329_; lean_object* v___x_1330_; 
v___x_1329_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__8, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__8_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__8);
v___x_1330_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_1330_, 0, v___x_1329_);
return v___x_1330_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__10(void){
_start:
{
lean_object* v___x_1331_; lean_object* v___x_1332_; 
v___x_1331_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9);
v___x_1332_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1332_, 0, v___x_1331_);
lean_ctor_set(v___x_1332_, 1, v___x_1331_);
return v___x_1332_;
}
}
static lean_object* _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__11(void){
_start:
{
lean_object* v___x_1333_; lean_object* v___x_1334_; lean_object* v___x_1335_; 
v___x_1333_ = lean_box(1);
v___x_1334_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6);
v___x_1335_ = lean_alloc_ctor(0, 3, 0);
lean_ctor_set(v___x_1335_, 0, v___x_1334_);
lean_ctor_set(v___x_1335_, 1, v___x_1334_);
lean_ctor_set(v___x_1335_, 2, v___x_1333_);
return v___x_1335_;
}
}
static uint8_t _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__18(void){
_start:
{
lean_object* v___x_1343_; lean_object* v___x_1344_; uint8_t v___x_1345_; 
v___x_1343_ = l_Lean_diagnostics;
v___x_1344_ = l_Lean_Options_empty;
v___x_1345_ = l_Lean_Option_get___at___00Lean_Elab_addMacroStack___at___00Lean_throwError___at___00Lean_throwErrorAt___at___00Lean_throwUnknownIdentifierAt___at___00Lean_throwUnknownConstantAt___at___00Lean_throwUnknownConstant___at___00Lean_getConstVal___at___00Lean_mkConstWithLevelParams___at___00Lean_Elab_addConstInfo___at___00Lean_Elab_PostprocessTraces_elabStoreTraceAs_spec__3_spec__5_spec__6_spec__9_spec__12_spec__14_spec__16_spec__18_spec__20_spec__21(v___x_1344_, v___x_1343_);
return v___x_1345_;
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2(lean_object* v___x_1346_, lean_object* v___x_1347_, lean_object* v___x_1348_, uint8_t v___x_1349_, lean_object* v_as_1350_, size_t v_sz_1351_, size_t v_i_1352_, lean_object* v_b_1353_){
_start:
{
lean_object* v_a_1356_; uint8_t v___x_1359_; 
v___x_1359_ = lean_usize_dec_lt(v_i_1352_, v_sz_1351_);
if (v___x_1359_ == 0)
{
lean_object* v___x_1360_; 
lean_dec_ref(v___x_1348_);
v___x_1360_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v___x_1360_, 0, v_b_1353_);
return v___x_1360_;
}
else
{
uint8_t v___x_1361_; lean_object* v_a_1362_; lean_object* v___x_1369_; lean_object* v___x_1370_; 
v___x_1361_ = lean_nat_dec_eq(v___x_1346_, v___x_1347_);
v_a_1362_ = lean_array_uget_borrowed(v_as_1350_, v_i_1352_);
lean_inc_ref(v___x_1348_);
v___x_1369_ = lean_elab_environment_to_kernel_env(v___x_1348_);
lean_inc(v_a_1362_);
v___x_1370_ = lean_environment_find(v___x_1369_, v_a_1362_);
if (lean_obj_tag(v___x_1370_) == 1)
{
lean_object* v_val_1371_; 
v_val_1371_ = lean_ctor_get(v___x_1370_, 0);
lean_inc(v_val_1371_);
lean_dec_ref_known(v___x_1370_, 1);
if (lean_obj_tag(v_val_1371_) == 2)
{
lean_object* v___x_1373_; uint8_t v_isShared_1374_; uint8_t v_isSharedCheck_1458_; 
v_isSharedCheck_1458_ = !lean_is_exclusive(v_val_1371_);
if (v_isSharedCheck_1458_ == 0)
{
lean_object* v_unused_1459_; 
v_unused_1459_ = lean_ctor_get(v_val_1371_, 0);
lean_dec(v_unused_1459_);
v___x_1373_ = v_val_1371_;
v_isShared_1374_ = v_isSharedCheck_1458_;
goto v_resetjp_1372_;
}
else
{
lean_dec(v_val_1371_);
v___x_1373_ = lean_box(0);
v_isShared_1374_ = v_isSharedCheck_1458_;
goto v_resetjp_1372_;
}
v_resetjp_1372_:
{
lean_object* v___x_1375_; lean_object* v___x_1376_; lean_object* v___x_1377_; lean_object* v___x_1378_; lean_object* v___x_1379_; lean_object* v___x_1380_; lean_object* v___x_1381_; lean_object* v___x_1382_; lean_object* v___x_1383_; lean_object* v___x_1384_; lean_object* v___x_1385_; lean_object* v___x_1386_; lean_object* v___x_1387_; lean_object* v___x_1388_; lean_object* v___y_1390_; lean_object* v___x_1431_; lean_object* v___x_1432_; uint8_t v___x_1433_; lean_object* v___x_1434_; uint8_t v___y_1436_; lean_object* v_env_1456_; uint8_t v___x_1457_; 
v___x_1375_ = lean_unsigned_to_nat(2u);
v___x_1376_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__3));
v___x_1377_ = lean_box(0);
v___x_1378_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__4));
v___x_1379_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__6);
v___x_1380_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__7, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__7_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__7);
v___x_1381_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__9);
v___x_1382_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__10, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__10_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__10);
v___x_1383_ = lean_obj_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__11, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__11_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__11);
v___x_1384_ = lean_alloc_ctor(0, 3, 1);
lean_ctor_set(v___x_1384_, 0, v___x_1381_);
lean_ctor_set(v___x_1384_, 1, v___x_1381_);
lean_ctor_set(v___x_1384_, 2, v___x_1379_);
lean_ctor_set_uint8(v___x_1384_, sizeof(void*)*3, v___x_1361_);
v___x_1385_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__12));
lean_inc_ref(v___x_1348_);
v___x_1386_ = lean_alloc_ctor(0, 9, 0);
lean_ctor_set(v___x_1386_, 0, v___x_1348_);
lean_ctor_set(v___x_1386_, 1, v___x_1375_);
lean_ctor_set(v___x_1386_, 2, v___x_1376_);
lean_ctor_set(v___x_1386_, 3, v___x_1378_);
lean_ctor_set(v___x_1386_, 4, v___x_1380_);
lean_ctor_set(v___x_1386_, 5, v___x_1382_);
lean_ctor_set(v___x_1386_, 6, v___x_1383_);
lean_ctor_set(v___x_1386_, 7, v___x_1384_);
lean_ctor_set(v___x_1386_, 8, v___x_1385_);
v___x_1387_ = lean_io_get_num_heartbeats();
lean_dec(v___x_1387_);
v___x_1388_ = lean_st_mk_ref(v___x_1386_);
v___x_1431_ = l_Lean_inheritedTraceOptions;
v___x_1432_ = lean_st_ref_get(v___x_1431_);
lean_dec(v___x_1432_);
v___x_1433_ = lean_uint8_once(&l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__18, &l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__18_once, _init_l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__18);
v___x_1434_ = lean_st_ref_get(v___x_1388_);
v_env_1456_ = lean_ctor_get(v___x_1434_, 0);
lean_inc_ref(v_env_1456_);
lean_dec(v___x_1434_);
v___x_1457_ = l_Lean_Kernel_isDiagnosticsEnabled(v_env_1456_);
lean_dec_ref(v_env_1456_);
if (v___x_1433_ == 0)
{
if (v___x_1457_ == 0)
{
v___y_1436_ = v___x_1361_;
goto v___jp_1435_;
}
else
{
v___y_1436_ = v___x_1433_;
goto v___jp_1435_;
}
}
else
{
v___y_1436_ = v___x_1457_;
goto v___jp_1435_;
}
v___jp_1389_:
{
lean_object* v___x_1391_; 
lean_inc(v_a_1362_);
v___x_1391_ = l_Lean_collectAxioms___at___00main_spec__1___redArg(v_a_1362_, v___y_1390_);
lean_dec(v___y_1390_);
if (lean_obj_tag(v___x_1391_) == 0)
{
lean_object* v_a_1392_; lean_object* v___x_1393_; lean_object* v___x_1394_; lean_object* v___x_1395_; lean_object* v___x_1396_; lean_object* v___x_1397_; lean_object* v___x_1398_; lean_object* v___x_1399_; lean_object* v___x_1400_; lean_object* v___x_1401_; lean_object* v___x_1402_; lean_object* v___x_1403_; size_t v___x_1404_; size_t v___x_1405_; 
lean_del_object(v___x_1373_);
v_a_1392_ = lean_ctor_get(v___x_1391_, 0);
lean_inc(v_a_1392_);
lean_dec_ref_known(v___x_1391_, 1);
v___x_1393_ = lean_st_ref_get(v___x_1388_);
lean_dec(v___x_1388_);
lean_dec(v___x_1393_);
v___x_1394_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__13));
lean_inc(v_a_1362_);
v___x_1395_ = l_CathedralKernelGraph_jid(v_a_1362_);
v___x_1396_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1396_, 0, v___x_1394_);
lean_ctor_set(v___x_1396_, 1, v___x_1395_);
v___x_1397_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__14));
v___x_1398_ = l_CathedralKernelGraph_jnames(v_a_1392_);
v___x_1399_ = lean_alloc_ctor(0, 2, 0);
lean_ctor_set(v___x_1399_, 0, v___x_1397_);
lean_ctor_set(v___x_1399_, 1, v___x_1398_);
v___x_1400_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1400_, 0, v___x_1399_);
lean_ctor_set(v___x_1400_, 1, v___x_1377_);
v___x_1401_ = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(v___x_1401_, 0, v___x_1396_);
lean_ctor_set(v___x_1401_, 1, v___x_1400_);
v___x_1402_ = l_Lean_Json_mkObj(v___x_1401_);
lean_dec_ref_known(v___x_1401_, 2);
v___x_1403_ = lean_array_push(v_b_1353_, v___x_1402_);
v___x_1404_ = ((size_t)1ULL);
v___x_1405_ = lean_usize_add(v_i_1352_, v___x_1404_);
v_i_1352_ = v___x_1405_;
v_b_1353_ = v___x_1403_;
goto _start;
}
else
{
lean_object* v_a_1407_; lean_object* v___x_1409_; uint8_t v_isShared_1410_; uint8_t v_isSharedCheck_1430_; 
lean_dec(v___x_1388_);
lean_dec_ref(v_b_1353_);
lean_dec_ref(v___x_1348_);
v_a_1407_ = lean_ctor_get(v___x_1391_, 0);
v_isSharedCheck_1430_ = !lean_is_exclusive(v___x_1391_);
if (v_isSharedCheck_1430_ == 0)
{
v___x_1409_ = v___x_1391_;
v_isShared_1410_ = v_isSharedCheck_1430_;
goto v_resetjp_1408_;
}
else
{
lean_inc(v_a_1407_);
lean_dec(v___x_1391_);
v___x_1409_ = lean_box(0);
v_isShared_1410_ = v_isSharedCheck_1430_;
goto v_resetjp_1408_;
}
v_resetjp_1408_:
{
if (lean_obj_tag(v_a_1407_) == 0)
{
lean_object* v_msg_1411_; lean_object* v___x_1412_; lean_object* v___x_1414_; 
v_msg_1411_ = lean_ctor_get(v_a_1407_, 1);
lean_inc_ref(v_msg_1411_);
lean_dec_ref_known(v_a_1407_, 2);
v___x_1412_ = l_Lean_MessageData_toString(v_msg_1411_);
if (v_isShared_1374_ == 0)
{
lean_ctor_set_tag(v___x_1373_, 18);
lean_ctor_set(v___x_1373_, 0, v___x_1412_);
v___x_1414_ = v___x_1373_;
goto v_reusejp_1413_;
}
else
{
lean_object* v_reuseFailAlloc_1418_; 
v_reuseFailAlloc_1418_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1418_, 0, v___x_1412_);
v___x_1414_ = v_reuseFailAlloc_1418_;
goto v_reusejp_1413_;
}
v_reusejp_1413_:
{
lean_object* v___x_1416_; 
if (v_isShared_1410_ == 0)
{
lean_ctor_set(v___x_1409_, 0, v___x_1414_);
v___x_1416_ = v___x_1409_;
goto v_reusejp_1415_;
}
else
{
lean_object* v_reuseFailAlloc_1417_; 
v_reuseFailAlloc_1417_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1417_, 0, v___x_1414_);
v___x_1416_ = v_reuseFailAlloc_1417_;
goto v_reusejp_1415_;
}
v_reusejp_1415_:
{
return v___x_1416_;
}
}
}
else
{
lean_object* v_id_1419_; lean_object* v___x_1420_; 
lean_del_object(v___x_1409_);
lean_del_object(v___x_1373_);
v_id_1419_ = lean_ctor_get(v_a_1407_, 0);
lean_inc(v_id_1419_);
lean_dec_ref_known(v_a_1407_, 2);
v___x_1420_ = l_Lean_InternalExceptionId_getName(v_id_1419_);
if (lean_obj_tag(v___x_1420_) == 0)
{
lean_object* v_a_1421_; lean_object* v___x_1422_; lean_object* v___x_1423_; lean_object* v___x_1424_; 
lean_dec(v_id_1419_);
v_a_1421_ = lean_ctor_get(v___x_1420_, 0);
lean_inc(v_a_1421_);
lean_dec_ref_known(v___x_1420_, 1);
v___x_1422_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__15));
v___x_1423_ = l_Lean_Name_toStringWithToken___at___00Lean_Name_toString_spec__0(v_a_1421_, v___x_1361_);
v___x_1424_ = lean_string_append(v___x_1422_, v___x_1423_);
lean_dec_ref(v___x_1423_);
v_a_1356_ = v___x_1424_;
goto v___jp_1355_;
}
else
{
lean_object* v___x_1425_; lean_object* v___x_1426_; lean_object* v___x_1427_; lean_object* v___x_1428_; lean_object* v___x_1429_; 
lean_dec_ref_known(v___x_1420_, 1);
v___x_1425_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__16));
v___x_1426_ = l_Nat_reprFast(v_id_1419_);
v___x_1427_ = lean_string_append(v___x_1425_, v___x_1426_);
lean_dec_ref(v___x_1426_);
v___x_1428_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__17));
v___x_1429_ = lean_string_append(v___x_1427_, v___x_1428_);
v_a_1356_ = v___x_1429_;
goto v___jp_1355_;
}
}
}
}
}
v___jp_1435_:
{
if (v___y_1436_ == 0)
{
lean_object* v___x_1437_; lean_object* v_env_1438_; lean_object* v_nextMacroScope_1439_; lean_object* v_ngen_1440_; lean_object* v_auxDeclNGen_1441_; lean_object* v_traceState_1442_; lean_object* v_messages_1443_; lean_object* v_infoState_1444_; lean_object* v_snapshotTasks_1445_; lean_object* v___x_1447_; uint8_t v_isShared_1448_; uint8_t v_isSharedCheck_1454_; 
v___x_1437_ = lean_st_ref_take(v___x_1388_);
v_env_1438_ = lean_ctor_get(v___x_1437_, 0);
v_nextMacroScope_1439_ = lean_ctor_get(v___x_1437_, 1);
v_ngen_1440_ = lean_ctor_get(v___x_1437_, 2);
v_auxDeclNGen_1441_ = lean_ctor_get(v___x_1437_, 3);
v_traceState_1442_ = lean_ctor_get(v___x_1437_, 4);
v_messages_1443_ = lean_ctor_get(v___x_1437_, 6);
v_infoState_1444_ = lean_ctor_get(v___x_1437_, 7);
v_snapshotTasks_1445_ = lean_ctor_get(v___x_1437_, 8);
v_isSharedCheck_1454_ = !lean_is_exclusive(v___x_1437_);
if (v_isSharedCheck_1454_ == 0)
{
lean_object* v_unused_1455_; 
v_unused_1455_ = lean_ctor_get(v___x_1437_, 5);
lean_dec(v_unused_1455_);
v___x_1447_ = v___x_1437_;
v_isShared_1448_ = v_isSharedCheck_1454_;
goto v_resetjp_1446_;
}
else
{
lean_inc(v_snapshotTasks_1445_);
lean_inc(v_infoState_1444_);
lean_inc(v_messages_1443_);
lean_inc(v_traceState_1442_);
lean_inc(v_auxDeclNGen_1441_);
lean_inc(v_ngen_1440_);
lean_inc(v_nextMacroScope_1439_);
lean_inc(v_env_1438_);
lean_dec(v___x_1437_);
v___x_1447_ = lean_box(0);
v_isShared_1448_ = v_isSharedCheck_1454_;
goto v_resetjp_1446_;
}
v_resetjp_1446_:
{
lean_object* v___x_1449_; lean_object* v___x_1451_; 
v___x_1449_ = l_Lean_Kernel_enableDiag(v_env_1438_, v___x_1433_);
if (v_isShared_1448_ == 0)
{
lean_ctor_set(v___x_1447_, 5, v___x_1382_);
lean_ctor_set(v___x_1447_, 0, v___x_1449_);
v___x_1451_ = v___x_1447_;
goto v_reusejp_1450_;
}
else
{
lean_object* v_reuseFailAlloc_1453_; 
v_reuseFailAlloc_1453_ = lean_alloc_ctor(0, 9, 0);
lean_ctor_set(v_reuseFailAlloc_1453_, 0, v___x_1449_);
lean_ctor_set(v_reuseFailAlloc_1453_, 1, v_nextMacroScope_1439_);
lean_ctor_set(v_reuseFailAlloc_1453_, 2, v_ngen_1440_);
lean_ctor_set(v_reuseFailAlloc_1453_, 3, v_auxDeclNGen_1441_);
lean_ctor_set(v_reuseFailAlloc_1453_, 4, v_traceState_1442_);
lean_ctor_set(v_reuseFailAlloc_1453_, 5, v___x_1382_);
lean_ctor_set(v_reuseFailAlloc_1453_, 6, v_messages_1443_);
lean_ctor_set(v_reuseFailAlloc_1453_, 7, v_infoState_1444_);
lean_ctor_set(v_reuseFailAlloc_1453_, 8, v_snapshotTasks_1445_);
v___x_1451_ = v_reuseFailAlloc_1453_;
goto v_reusejp_1450_;
}
v_reusejp_1450_:
{
lean_object* v___x_1452_; 
v___x_1452_ = lean_st_ref_put(v___x_1388_, v___x_1451_);
lean_inc(v___x_1388_);
v___y_1390_ = v___x_1388_;
goto v___jp_1389_;
}
}
}
else
{
lean_inc(v___x_1388_);
v___y_1390_ = v___x_1388_;
goto v___jp_1389_;
}
}
}
}
else
{
lean_dec(v_val_1371_);
lean_dec_ref(v_b_1353_);
lean_dec_ref(v___x_1348_);
goto v___jp_1363_;
}
}
else
{
lean_dec(v___x_1370_);
lean_dec_ref(v_b_1353_);
lean_dec_ref(v___x_1348_);
goto v___jp_1363_;
}
v___jp_1363_:
{
lean_object* v___x_1364_; lean_object* v___x_1365_; lean_object* v___x_1366_; lean_object* v___x_1367_; lean_object* v___x_1368_; 
v___x_1364_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___closed__0));
lean_inc(v_a_1362_);
v___x_1365_ = l_Lean_Name_toStringWithToken___at___00Lean_Name_toString_spec__0(v_a_1362_, v___x_1361_);
v___x_1366_ = lean_string_append(v___x_1364_, v___x_1365_);
lean_dec_ref(v___x_1365_);
v___x_1367_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_1367_, 0, v___x_1366_);
v___x_1368_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_1368_, 0, v___x_1367_);
return v___x_1368_;
}
}
v___jp_1355_:
{
lean_object* v___x_1357_; lean_object* v___x_1358_; 
v___x_1357_ = lean_alloc_ctor(18, 1, 0);
lean_ctor_set(v___x_1357_, 0, v_a_1356_);
v___x_1358_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_1358_, 0, v___x_1357_);
return v___x_1358_;
}
}
}
LEAN_EXPORT lean_object* l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2___boxed(lean_object* v___x_1460_, lean_object* v___x_1461_, lean_object* v___x_1462_, lean_object* v___x_1463_, lean_object* v_as_1464_, lean_object* v_sz_1465_, lean_object* v_i_1466_, lean_object* v_b_1467_, lean_object* v___y_1468_){
_start:
{
uint8_t v___x_4763__boxed_1469_; size_t v_sz_boxed_1470_; size_t v_i_boxed_1471_; lean_object* v_res_1472_; 
v___x_4763__boxed_1469_ = lean_unbox(v___x_1463_);
v_sz_boxed_1470_ = lean_unbox_usize(v_sz_1465_);
lean_dec(v_sz_1465_);
v_i_boxed_1471_ = lean_unbox_usize(v_i_1466_);
lean_dec(v_i_1466_);
v_res_1472_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2(v___x_1460_, v___x_1461_, v___x_1462_, v___x_4763__boxed_1469_, v_as_1464_, v_sz_boxed_1470_, v_i_boxed_1471_, v_b_1467_);
lean_dec_ref(v_as_1464_);
lean_dec(v___x_1461_);
lean_dec(v___x_1460_);
return v_res_1472_;
}
}
static lean_object* _init_l_main___boxed__const__1(void){
_start:
{
uint32_t v___x_1485_; lean_object* v___x_1486_; 
v___x_1485_ = 0;
v___x_1486_ = lean_box_uint32(v___x_1485_);
return v___x_1486_;
}
}
LEAN_EXPORT lean_object* _lean_main(lean_object* v_args_1487_){
_start:
{
if (lean_obj_tag(v_args_1487_) == 1)
{
lean_object* v_tail_1492_; 
v_tail_1492_ = lean_ctor_get(v_args_1487_, 1);
lean_inc(v_tail_1492_);
if (lean_obj_tag(v_tail_1492_) == 1)
{
lean_object* v_tail_1493_; 
v_tail_1493_ = lean_ctor_get(v_tail_1492_, 1);
lean_inc(v_tail_1493_);
if (lean_obj_tag(v_tail_1493_) == 1)
{
lean_object* v_head_1494_; lean_object* v_head_1495_; lean_object* v_head_1496_; lean_object* v_tail_1497_; uint8_t v___x_1498_; 
v_head_1494_ = lean_ctor_get(v_args_1487_, 0);
lean_inc(v_head_1494_);
lean_dec_ref_known(v_args_1487_, 2);
v_head_1495_ = lean_ctor_get(v_tail_1492_, 0);
lean_inc(v_head_1495_);
lean_dec_ref_known(v_tail_1492_, 2);
v_head_1496_ = lean_ctor_get(v_tail_1493_, 0);
lean_inc(v_head_1496_);
v_tail_1497_ = lean_ctor_get(v_tail_1493_, 1);
lean_inc(v_tail_1497_);
lean_dec_ref_known(v_tail_1493_, 2);
v___x_1498_ = l_List_isEmpty___redArg(v_tail_1497_);
if (v___x_1498_ == 0)
{
lean_object* v___x_1499_; lean_object* v___x_1500_; 
v___x_1499_ = lean_box(0);
v___x_1500_ = l_Lean_initSearchPath(v_head_1494_, v___x_1499_);
if (lean_obj_tag(v___x_1500_) == 0)
{
lean_object* v___x_1502_; uint8_t v_isShared_1503_; uint8_t v_isSharedCheck_1590_; 
v_isSharedCheck_1590_ = !lean_is_exclusive(v___x_1500_);
if (v_isSharedCheck_1590_ == 0)
{
lean_object* v_unused_1591_; 
v_unused_1591_ = lean_ctor_get(v___x_1500_, 0);
lean_dec(v_unused_1591_);
v___x_1502_ = v___x_1500_;
v_isShared_1503_ = v_isSharedCheck_1590_;
goto v_resetjp_1501_;
}
else
{
lean_dec(v___x_1500_);
v___x_1502_ = lean_box(0);
v_isShared_1503_ = v_isSharedCheck_1590_;
goto v_resetjp_1501_;
}
v_resetjp_1501_:
{
lean_object* v___x_1504_; size_t v_sz_1505_; size_t v___x_1506_; lean_object* v___x_1507_; lean_object* v___x_1508_; lean_object* v___x_1509_; lean_object* v_size_1511_; lean_object* v___y_1581_; uint8_t v___x_1583_; 
v___x_1504_ = lean_array_mk(v_tail_1497_);
v_sz_1505_ = lean_array_size(v___x_1504_);
v___x_1506_ = ((size_t)0ULL);
v___x_1507_ = l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0(v_sz_1505_, v___x_1506_, v___x_1504_);
v___x_1508_ = lean_unsigned_to_nat(0u);
v___x_1509_ = lean_array_get_size(v___x_1507_);
v___x_1583_ = lean_nat_dec_lt(v___x_1508_, v___x_1509_);
if (v___x_1583_ == 0)
{
v_size_1511_ = v___x_1508_;
goto v___jp_1510_;
}
else
{
lean_object* v___x_1584_; uint8_t v___x_1585_; 
v___x_1584_ = lean_obj_once(&l_CathedralKernelGraph_exprRefs___closed__4, &l_CathedralKernelGraph_exprRefs___closed__4_once, _init_l_CathedralKernelGraph_exprRefs___closed__4);
v___x_1585_ = lean_nat_dec_le(v___x_1509_, v___x_1509_);
if (v___x_1585_ == 0)
{
if (v___x_1583_ == 0)
{
v_size_1511_ = v___x_1508_;
goto v___jp_1510_;
}
else
{
size_t v___x_1586_; lean_object* v___x_1587_; 
v___x_1586_ = lean_usize_of_nat(v___x_1509_);
v___x_1587_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3(v___x_1507_, v___x_1506_, v___x_1586_, v___x_1584_);
v___y_1581_ = v___x_1587_;
goto v___jp_1580_;
}
}
else
{
size_t v___x_1588_; lean_object* v___x_1589_; 
v___x_1588_ = lean_usize_of_nat(v___x_1509_);
v___x_1589_ = l___private_Init_Data_Array_Basic_0__Array_foldlMUnsafe_fold___at___00main_spec__3(v___x_1507_, v___x_1506_, v___x_1588_, v___x_1584_);
v___y_1581_ = v___x_1589_;
goto v___jp_1580_;
}
}
v___jp_1510_:
{
uint8_t v___x_1512_; 
v___x_1512_ = lean_nat_dec_eq(v_size_1511_, v___x_1509_);
if (v___x_1512_ == 0)
{
lean_object* v___x_1513_; lean_object* v___x_1515_; 
lean_dec(v_size_1511_);
lean_dec_ref(v___x_1507_);
lean_dec(v_head_1496_);
lean_dec(v_head_1495_);
v___x_1513_ = ((lean_object*)(l_main___closed__3));
if (v_isShared_1503_ == 0)
{
lean_ctor_set_tag(v___x_1502_, 1);
lean_ctor_set(v___x_1502_, 0, v___x_1513_);
v___x_1515_ = v___x_1502_;
goto v_reusejp_1514_;
}
else
{
lean_object* v_reuseFailAlloc_1516_; 
v_reuseFailAlloc_1516_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1516_, 0, v___x_1513_);
v___x_1515_ = v_reuseFailAlloc_1516_;
goto v_reusejp_1514_;
}
v_reusejp_1514_:
{
return v___x_1515_;
}
}
else
{
lean_object* v___x_1517_; lean_object* v___x_1518_; lean_object* v___x_1519_; lean_object* v___x_1520_; lean_object* v___x_1521_; lean_object* v___x_1522_; lean_object* v___x_1523_; lean_object* v___x_1524_; lean_object* v___x_1525_; uint32_t v___x_1526_; lean_object* v___x_1527_; uint8_t v___x_1528_; lean_object* v___x_1529_; lean_object* v___x_1530_; 
lean_del_object(v___x_1502_);
v___x_1517_ = lean_box(0);
v___x_1518_ = ((lean_object*)(l___private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00__private_Init_Data_Array_Basic_0__Array_mapMUnsafe_map___at___00main_spec__0_spec__0___closed__0));
v___x_1519_ = l_String_splitOnAux(v_head_1495_, v___x_1518_, v___x_1508_, v___x_1508_, v___x_1508_, v___x_1499_);
lean_dec(v_head_1495_);
v___x_1520_ = l_List_foldl___at___00Lean_moduleNameOfFileName_spec__0(v___x_1517_, v___x_1519_);
v___x_1521_ = lean_alloc_ctor(0, 1, 3);
lean_ctor_set(v___x_1521_, 0, v___x_1520_);
lean_ctor_set_uint8(v___x_1521_, sizeof(void*)*1, v___x_1498_);
lean_ctor_set_uint8(v___x_1521_, sizeof(void*)*1 + 1, v___x_1512_);
lean_ctor_set_uint8(v___x_1521_, sizeof(void*)*1 + 2, v___x_1498_);
v___x_1522_ = lean_unsigned_to_nat(1u);
v___x_1523_ = lean_mk_empty_array_with_capacity(v___x_1522_);
v___x_1524_ = lean_array_push(v___x_1523_, v___x_1521_);
v___x_1525_ = l_Lean_Options_empty;
v___x_1526_ = 0;
v___x_1527_ = ((lean_object*)(l_main___closed__4));
v___x_1528_ = 2;
v___x_1529_ = lean_box(1);
v___x_1530_ = l_Lean_importModules(v___x_1524_, v___x_1525_, v___x_1526_, v___x_1527_, v___x_1498_, v___x_1498_, v___x_1528_, v___x_1529_);
if (lean_obj_tag(v___x_1530_) == 0)
{
lean_object* v_a_1531_; lean_object* v___x_1532_; size_t v_sz_1533_; lean_object* v___x_1534_; 
v_a_1531_ = lean_ctor_get(v___x_1530_, 0);
lean_inc(v_a_1531_);
lean_dec_ref_known(v___x_1530_, 1);
v___x_1532_ = l_Lean_Environment_setExporting(v_a_1531_, v___x_1498_);
v_sz_1533_ = lean_array_size(v___x_1507_);
lean_inc_ref(v___x_1532_);
v___x_1534_ = l___private_Init_Data_Array_Basic_0__Array_forIn_x27Unsafe_loop___at___00main_spec__2(v_size_1511_, v___x_1509_, v___x_1532_, v___x_1498_, v___x_1507_, v_sz_1533_, v___x_1506_, v___x_1527_);
lean_dec(v_size_1511_);
if (lean_obj_tag(v___x_1534_) == 0)
{
lean_object* v_a_1535_; lean_object* v___x_1536_; 
v_a_1535_ = lean_ctor_get(v___x_1534_, 0);
lean_inc(v_a_1535_);
lean_dec_ref_known(v___x_1534_, 1);
v___x_1536_ = l_CathedralKernelGraph_exportGraph(v___x_1532_, v___x_1507_, v_a_1535_, v_head_1496_);
lean_dec(v_head_1496_);
if (lean_obj_tag(v___x_1536_) == 0)
{
lean_object* v___x_1537_; lean_object* v___x_1538_; 
lean_dec_ref_known(v___x_1536_, 1);
v___x_1537_ = ((lean_object*)(l_main___closed__5));
v___x_1538_ = l_IO_println___at___00__private_Lean_Shell_0__Lean_ShellOptions_process_spec__3(v___x_1537_);
if (lean_obj_tag(v___x_1538_) == 0)
{
lean_object* v___x_1540_; uint8_t v_isShared_1541_; uint8_t v_isSharedCheck_1546_; 
v_isSharedCheck_1546_ = !lean_is_exclusive(v___x_1538_);
if (v_isSharedCheck_1546_ == 0)
{
lean_object* v_unused_1547_; 
v_unused_1547_ = lean_ctor_get(v___x_1538_, 0);
lean_dec(v_unused_1547_);
v___x_1540_ = v___x_1538_;
v_isShared_1541_ = v_isSharedCheck_1546_;
goto v_resetjp_1539_;
}
else
{
lean_dec(v___x_1538_);
v___x_1540_ = lean_box(0);
v_isShared_1541_ = v_isSharedCheck_1546_;
goto v_resetjp_1539_;
}
v_resetjp_1539_:
{
lean_object* v___x_1542_; lean_object* v___x_1544_; 
v___x_1542_ = l_main___boxed__const__1;
if (v_isShared_1541_ == 0)
{
lean_ctor_set(v___x_1540_, 0, v___x_1542_);
v___x_1544_ = v___x_1540_;
goto v_reusejp_1543_;
}
else
{
lean_object* v_reuseFailAlloc_1545_; 
v_reuseFailAlloc_1545_ = lean_alloc_ctor(0, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1545_, 0, v___x_1542_);
v___x_1544_ = v_reuseFailAlloc_1545_;
goto v_reusejp_1543_;
}
v_reusejp_1543_:
{
return v___x_1544_;
}
}
}
else
{
lean_object* v_a_1548_; lean_object* v___x_1550_; uint8_t v_isShared_1551_; uint8_t v_isSharedCheck_1555_; 
v_a_1548_ = lean_ctor_get(v___x_1538_, 0);
v_isSharedCheck_1555_ = !lean_is_exclusive(v___x_1538_);
if (v_isSharedCheck_1555_ == 0)
{
v___x_1550_ = v___x_1538_;
v_isShared_1551_ = v_isSharedCheck_1555_;
goto v_resetjp_1549_;
}
else
{
lean_inc(v_a_1548_);
lean_dec(v___x_1538_);
v___x_1550_ = lean_box(0);
v_isShared_1551_ = v_isSharedCheck_1555_;
goto v_resetjp_1549_;
}
v_resetjp_1549_:
{
lean_object* v___x_1553_; 
if (v_isShared_1551_ == 0)
{
v___x_1553_ = v___x_1550_;
goto v_reusejp_1552_;
}
else
{
lean_object* v_reuseFailAlloc_1554_; 
v_reuseFailAlloc_1554_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1554_, 0, v_a_1548_);
v___x_1553_ = v_reuseFailAlloc_1554_;
goto v_reusejp_1552_;
}
v_reusejp_1552_:
{
return v___x_1553_;
}
}
}
}
else
{
lean_object* v_a_1556_; lean_object* v___x_1558_; uint8_t v_isShared_1559_; uint8_t v_isSharedCheck_1563_; 
v_a_1556_ = lean_ctor_get(v___x_1536_, 0);
v_isSharedCheck_1563_ = !lean_is_exclusive(v___x_1536_);
if (v_isSharedCheck_1563_ == 0)
{
v___x_1558_ = v___x_1536_;
v_isShared_1559_ = v_isSharedCheck_1563_;
goto v_resetjp_1557_;
}
else
{
lean_inc(v_a_1556_);
lean_dec(v___x_1536_);
v___x_1558_ = lean_box(0);
v_isShared_1559_ = v_isSharedCheck_1563_;
goto v_resetjp_1557_;
}
v_resetjp_1557_:
{
lean_object* v___x_1561_; 
if (v_isShared_1559_ == 0)
{
v___x_1561_ = v___x_1558_;
goto v_reusejp_1560_;
}
else
{
lean_object* v_reuseFailAlloc_1562_; 
v_reuseFailAlloc_1562_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1562_, 0, v_a_1556_);
v___x_1561_ = v_reuseFailAlloc_1562_;
goto v_reusejp_1560_;
}
v_reusejp_1560_:
{
return v___x_1561_;
}
}
}
}
else
{
lean_object* v_a_1564_; lean_object* v___x_1566_; uint8_t v_isShared_1567_; uint8_t v_isSharedCheck_1571_; 
lean_dec_ref(v___x_1532_);
lean_dec_ref(v___x_1507_);
lean_dec(v_head_1496_);
v_a_1564_ = lean_ctor_get(v___x_1534_, 0);
v_isSharedCheck_1571_ = !lean_is_exclusive(v___x_1534_);
if (v_isSharedCheck_1571_ == 0)
{
v___x_1566_ = v___x_1534_;
v_isShared_1567_ = v_isSharedCheck_1571_;
goto v_resetjp_1565_;
}
else
{
lean_inc(v_a_1564_);
lean_dec(v___x_1534_);
v___x_1566_ = lean_box(0);
v_isShared_1567_ = v_isSharedCheck_1571_;
goto v_resetjp_1565_;
}
v_resetjp_1565_:
{
lean_object* v___x_1569_; 
if (v_isShared_1567_ == 0)
{
v___x_1569_ = v___x_1566_;
goto v_reusejp_1568_;
}
else
{
lean_object* v_reuseFailAlloc_1570_; 
v_reuseFailAlloc_1570_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1570_, 0, v_a_1564_);
v___x_1569_ = v_reuseFailAlloc_1570_;
goto v_reusejp_1568_;
}
v_reusejp_1568_:
{
return v___x_1569_;
}
}
}
}
else
{
lean_object* v_a_1572_; lean_object* v___x_1574_; uint8_t v_isShared_1575_; uint8_t v_isSharedCheck_1579_; 
lean_dec(v_size_1511_);
lean_dec_ref(v___x_1507_);
lean_dec(v_head_1496_);
v_a_1572_ = lean_ctor_get(v___x_1530_, 0);
v_isSharedCheck_1579_ = !lean_is_exclusive(v___x_1530_);
if (v_isSharedCheck_1579_ == 0)
{
v___x_1574_ = v___x_1530_;
v_isShared_1575_ = v_isSharedCheck_1579_;
goto v_resetjp_1573_;
}
else
{
lean_inc(v_a_1572_);
lean_dec(v___x_1530_);
v___x_1574_ = lean_box(0);
v_isShared_1575_ = v_isSharedCheck_1579_;
goto v_resetjp_1573_;
}
v_resetjp_1573_:
{
lean_object* v___x_1577_; 
if (v_isShared_1575_ == 0)
{
v___x_1577_ = v___x_1574_;
goto v_reusejp_1576_;
}
else
{
lean_object* v_reuseFailAlloc_1578_; 
v_reuseFailAlloc_1578_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1578_, 0, v_a_1572_);
v___x_1577_ = v_reuseFailAlloc_1578_;
goto v_reusejp_1576_;
}
v_reusejp_1576_:
{
return v___x_1577_;
}
}
}
}
}
v___jp_1580_:
{
lean_object* v_size_1582_; 
v_size_1582_ = lean_ctor_get(v___y_1581_, 0);
lean_inc(v_size_1582_);
lean_dec_ref(v___y_1581_);
v_size_1511_ = v_size_1582_;
goto v___jp_1510_;
}
}
}
else
{
lean_object* v_a_1592_; lean_object* v___x_1594_; uint8_t v_isShared_1595_; uint8_t v_isSharedCheck_1599_; 
lean_dec(v_tail_1497_);
lean_dec(v_head_1496_);
lean_dec(v_head_1495_);
v_a_1592_ = lean_ctor_get(v___x_1500_, 0);
v_isSharedCheck_1599_ = !lean_is_exclusive(v___x_1500_);
if (v_isSharedCheck_1599_ == 0)
{
v___x_1594_ = v___x_1500_;
v_isShared_1595_ = v_isSharedCheck_1599_;
goto v_resetjp_1593_;
}
else
{
lean_inc(v_a_1592_);
lean_dec(v___x_1500_);
v___x_1594_ = lean_box(0);
v_isShared_1595_ = v_isSharedCheck_1599_;
goto v_resetjp_1593_;
}
v_resetjp_1593_:
{
lean_object* v___x_1597_; 
if (v_isShared_1595_ == 0)
{
v___x_1597_ = v___x_1594_;
goto v_reusejp_1596_;
}
else
{
lean_object* v_reuseFailAlloc_1598_; 
v_reuseFailAlloc_1598_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v_reuseFailAlloc_1598_, 0, v_a_1592_);
v___x_1597_ = v_reuseFailAlloc_1598_;
goto v_reusejp_1596_;
}
v_reusejp_1596_:
{
return v___x_1597_;
}
}
}
}
else
{
lean_object* v___x_1600_; lean_object* v___x_1601_; 
lean_dec(v_tail_1497_);
lean_dec(v_head_1496_);
lean_dec(v_head_1495_);
lean_dec(v_head_1494_);
v___x_1600_ = ((lean_object*)(l_main___closed__7));
v___x_1601_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_1601_, 0, v___x_1600_);
return v___x_1601_;
}
}
else
{
lean_dec(v_tail_1493_);
lean_dec_ref_known(v_tail_1492_, 2);
lean_dec_ref_known(v_args_1487_, 2);
goto v___jp_1489_;
}
}
else
{
lean_dec_ref_known(v_args_1487_, 2);
lean_dec(v_tail_1492_);
goto v___jp_1489_;
}
}
else
{
lean_dec(v_args_1487_);
goto v___jp_1489_;
}
v___jp_1489_:
{
lean_object* v___x_1490_; lean_object* v___x_1491_; 
v___x_1490_ = ((lean_object*)(l_main___closed__1));
v___x_1491_ = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(v___x_1491_, 0, v___x_1490_);
return v___x_1491_;
}
}
}
LEAN_EXPORT lean_object* l_main___boxed(lean_object* v_args_1602_, lean_object* v_a_1603_){
_start:
{
lean_object* v_res_1604_; 
v_res_1604_ = _lean_main(v_args_1602_);
return v_res_1604_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Lean(uint8_t builtin);
void lean_initialize();
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_NativeGraph(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
lean_initialize();
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Lean(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_main___boxed__const__1 = _init_l_main___boxed__const__1();
lean_mark_persistent(l_main___boxed__const__1);
return lean_io_result_mk_ok(lean_box(0));
}
char ** lean_setup_args(int argc, char ** argv);
#if defined(WIN32) || defined(_WIN32)
#include <windows.h>
#endif
lean_object* run_main(int argc, char ** argv) {
    lean_object* in = lean_box(0);
    int i = argc;
    while (i > 1) {
      lean_object* n;
      i--;
      n = lean_alloc_ctor(1,2,0); lean_ctor_set(n, 0, lean_mk_string(argv[i])); lean_ctor_set(n, 1, in);
      in = n;
    }
    return _lean_main(in);
}
int main(int argc, char ** argv) {
#if defined(WIN32) || defined(_WIN32)
  SetErrorMode(SEM_FAILCRITICALERRORS);
  SetConsoleOutputCP(CP_UTF8);
#endif
  lean_object* res;
  argv = lean_setup_args(argc, argv);
  res = initialize_NativeGraph(1 /* builtin */);
  lean_io_mark_end_initialization();
  if (lean_io_result_is_ok(res)) {
    lean_dec_ref(res);
    lean_init_task_manager();
    res = lean_run_main(&run_main, argc, argv);
  }
  lean_finalize_task_manager();
  if (lean_io_result_is_ok(res)) {
    int ret = lean_unbox_uint32(lean_io_result_get_value(res));
    lean_dec_ref(res);
    return ret;
  } else {
    lean_io_result_show_error(res);
    lean_dec_ref(res);
    return 1;
  }
}
#ifdef __cplusplus
}
#endif
