class zcl_atc_check_class_name definition
  public
  final
  create public .

  public section.
    interfaces if_ci_atc_check.

    constants:
      begin of finding_codes,
        code1 type if_ci_atc_check=>ty_finding_code value 'CODE_1',
      end of finding_codes.
    METHODS constructor.
  protected section.
  private section.
    data naming_convention type string.
endclass.

class zcl_atc_check_class_name implementation.

  method constructor.
  endmethod.

  method if_ci_atc_check~get_meta_data.
    meta_data = new meta_data( naming_convention ).
  endmethod.

  method if_ci_atc_check~run.
    data finding type if_ci_atc_check=>ty_finding.
    data length type i.
    length = strlen( me->naming_convention ).
    if object-name(length) <> me->naming_convention.
      finding-code = me->finding_codes-code1.
      finding-location-object = value #(
        type = 'PROG'
        name = |{ object-name align = left pad = '=' width = 30 }CU|
      ).
      finding-location-position-column = 1.
      finding-location-position-line = 1.
      append finding to findings.
    endif.
  endmethod.

  method if_ci_atc_check~set_assistant_factory.
  endmethod.

  method if_ci_atc_check~set_attributes ##NEEDED.
    data(naming_convention_value) = attributes[ name = `NamingConvention` ]-value.
    me->naming_convention = naming_convention_value->*.
  endmethod.

  method if_ci_atc_check~verify_prerequisites ##NEEDED.
  endmethod.

endclass.
