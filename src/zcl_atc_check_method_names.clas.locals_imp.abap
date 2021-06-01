class meta_data definition final.
  public section.
    interfaces if_ci_atc_check_meta_data.
    data naming_convention type string.
    METHODS constructor
      IMPORTING
        i_naming_convention TYPE string.
endclass.

class meta_data implementation.

  method constructor.
    me->naming_convention = i_naming_convention.
  endmethod.

  method if_ci_atc_check_meta_data~get_attributes ##NEEDED.
   attributes = VALUE #(
      ( name = `NamingConvention`
        kind = if_ci_atc_check_meta_data=>attribute_kinds-elementary
        value = ref #( naming_convention ) )
    ).
  endmethod.

  method if_ci_atc_check_meta_data~get_checked_object_types.
    types = value #( ( 'CLAS' ) ).
  endmethod.

  method if_ci_atc_check_meta_data~get_description.
    description = 'Check class name'.
  endmethod.

  method if_ci_atc_check_meta_data~get_finding_code_infos.
    finding_code_infos = value #(
      ( code = zcl_atc_check_method_names=>finding_codes-code1
        severity = if_ci_atc_check=>finding_severities-error
        text = 'Name of class is not allowed' )
    ).
  endmethod.

  method if_ci_atc_check_meta_data~uses_checksums.
  endmethod.

  method if_ci_atc_check_meta_data~get_quickfix_code_infos.
  endmethod.

  method if_ci_atc_check_meta_data~is_remote_enabled.
    is_remote_enabled = abap_true.
  endmethod.
endclass.
