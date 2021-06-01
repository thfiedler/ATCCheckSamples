class zcl_atc_check_method_names definition
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

class zcl_atc_check_method_names implementation.

  method constructor.
  endmethod.

  method if_ci_atc_check~get_meta_data.
    meta_data = new meta_data( naming_convention ).
  endmethod.

  method if_ci_atc_check~run.
    data finding type if_ci_atc_check=>ty_finding.

    data(code_provider) = data_provider->get_code_provider( ).
    data(procedures) = code_provider->get_procedures( code_provider->object_to_comp_unit( object )  ).

    loop at procedures->* assigning field-symbol(<procedure>).
      if <procedure>-id-kind =  if_ci_atc_source_code_provider=>procedure_kinds-method.
        loop at <procedure>-statements assigning field-symbol(<statement>).
          if <statement>-keyword = 'IF'.
             finding-code = me->finding_codes-code1.
             finding-location-object = object.
             finding-location-position = <statement>-position.
             append finding to findings.
          endif.
        endloop.
      endif.
    endloop.
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
