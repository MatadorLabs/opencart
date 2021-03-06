<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-error"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-edit"></i> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="btn"><i class="icon-ok"></i> <?php echo $button_save; ?></a> <a href="<?php echo $cancel; ?>" class="btn"><i class="icon-remove"></i> <?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><?php foreach ($languages as $language) { ?>
              <input type="text" name="custom_field_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($custom_field_description[$language['language_id']]) ? $custom_field_description[$language['language_id']]['name'] : ''; ?>" />
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
              <?php } ?>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_type; ?></td>
            <td><select name="type">
                <optgroup label="<?php echo $text_choose; ?>">
                <?php if ($type == 'select') { ?>
                <option value="select" selected="selected"><?php echo $text_select; ?></option>
                <?php } else { ?>
                <option value="select"><?php echo $text_select; ?></option>
                <?php } ?>
                <?php if ($type == 'radio') { ?>
                <option value="radio" selected="selected"><?php echo $text_radio; ?></option>
                <?php } else { ?>
                <option value="radio"><?php echo $text_radio; ?></option>
                <?php } ?>
                <?php if ($type == 'checkbox') { ?>
                <option value="checkbox" selected="selected"><?php echo $text_checkbox; ?></option>
                <?php } else { ?>
                <option value="checkbox"><?php echo $text_checkbox; ?></option>
                <?php } ?>
                </optgroup>
                <optgroup label="<?php echo $text_input; ?>">
                <?php if ($type == 'text') { ?>
                <option value="text" selected="selected"><?php echo $text_text; ?></option>
                <?php } else { ?>
                <option value="text"><?php echo $text_text; ?></option>
                <?php } ?>
                <?php if ($type == 'textarea') { ?>
                <option value="textarea" selected="selected"><?php echo $text_textarea; ?></option>
                <?php } else { ?>
                <option value="textarea"><?php echo $text_textarea; ?></option>
                <?php } ?>
                </optgroup>
                <optgroup label="<?php echo $text_file; ?>">
                <?php if ($type == 'file') { ?>
                <option value="file" selected="selected"><?php echo $text_file; ?></option>
                <?php } else { ?>
                <option value="file"><?php echo $text_file; ?></option>
                <?php } ?>
                </optgroup>
                <optgroup label="<?php echo $text_date; ?>">
                <?php if ($type == 'date') { ?>
                <option value="date" selected="selected"><?php echo $text_date; ?></option>
                <?php } else { ?>
                <option value="date"><?php echo $text_date; ?></option>
                <?php } ?>
                <?php if ($type == 'time') { ?>
                <option value="time" selected="selected"><?php echo $text_time; ?></option>
                <?php } else { ?>
                <option value="time"><?php echo $text_time; ?></option>
                <?php } ?>
                <?php if ($type == 'datetime') { ?>
                <option value="datetime" selected="selected"><?php echo $text_datetime; ?></option>
                <?php } else { ?>
                <option value="datetime"><?php echo $text_datetime; ?></option>
                <?php } ?>
                </optgroup>
              </select></td>
          </tr>
          <tr id="display-value">
            <td><?php echo $entry_value; ?></td>
            <td><input type="text" name="value" value="<?php echo $value; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_group; ?></td>
            <td><div class="scrollbox">
                <?php $customer_group_row = 0; ?>
                <?php $class = 'odd'; ?>
                <?php foreach ($customer_groups as $customer_group) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($customer_group['customer_group_id'], $custom_field_customer_group)) { ?>
                  <input type="checkbox" name="custom_field_customer_group[<?php echo $customer_group_row; ?>][customer_group_id]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                  <?php echo $customer_group['name']; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_field_customer_group[<?php echo $customer_group_row; ?>][customer_group_id]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?>
                  <?php } ?>
                </div>
                <?php $customer_group_row++; ?>
                <?php } ?>
              </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_required; ?></td>
            <td><div class="scrollbox">
                <?php $customer_group_row = 0; ?>
                <?php $class = 'odd'; ?>
                <?php foreach ($customer_groups as $customer_group) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($customer_group['customer_group_id'], $custom_field_required)) { ?>
                  <input type="checkbox" name="custom_field_customer_group[<?php echo $customer_group_row; ?>][required]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                  <?php echo $customer_group['name']; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_field_customer_group[<?php echo $customer_group_row; ?>][required]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?>
                  <?php } ?>
                </div>
                <?php $customer_group_row++; ?>
                <?php } ?>
              </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_location; ?></td>
            <td><select name="location">
                <?php if ($location == 'customer') { ?>
                <option value="customer" selected="selected"><?php echo $text_customer; ?></option>
                <?php } else { ?>
                <option value="customer"><?php echo $text_customer; ?></option>
                <?php } ?>
                <?php if ($location == 'address') { ?>
                <option value="address" selected="selected"><?php echo $text_address; ?></option>
                <?php } else { ?>
                <option value="address"><?php echo $text_address; ?></option>
                <?php } ?>
                <?php if ($location == 'payment_address') { ?>
                <option value="payment_address" selected="selected"><?php echo $text_payment_address; ?></option>
                <?php } else { ?>
                <option value="payment_address"><?php echo $text_payment_address; ?></option>
                <?php } ?>
                <?php if ($location == 'shipping_address') { ?>
                <option value="shipping_address" selected="selected"><?php echo $text_shipping_address; ?></option>
                <?php } else { ?>
                <option value="shipping_address"><?php echo $text_shipping_address; ?></option>
                <?php } ?>
              </select>
              <div class="scrollbox">
                <?php $customer_group_row = 0; ?>
                <?php $class = 'odd'; ?>
                <?php foreach ($customer_groups as $customer_group) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($customer_group['customer_group_id'], $custom_field_required)) { ?>
                  <input type="checkbox" name="custom_field_location[<?php echo $customer_group_row; ?>]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                  <?php echo $customer_group['name']; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="custom_field_location[<?php echo $customer_group_row; ?>]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                  <?php echo $customer_group['name']; ?>
                  <?php } ?>
                </div>
                <?php $customer_group_row++; ?>
                <?php } ?>
              </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_position; ?></td>
            <td><select name="position">
                <?php if ($position == 'begining') { ?>
                <option value="begining" selected="selected"><?php echo $text_begining; ?></option>
                <?php } else { ?>
                <option value="begining"><?php echo $text_begining; ?></option>
                <?php } ?>
                <?php if ($position == 'firstname') { ?>
                <option value="firstname" selected="selected"><?php echo $text_firstname; ?></option>
                <?php } else { ?>
                <option value="firstname"><?php echo $text_firstname; ?></option>
                <?php } ?>
                <?php if ($position == 'lastname') { ?>
                <option value="lastname" selected="selected"><?php echo $text_lastname; ?></option>
                <?php } else { ?>
                <option value="lastname"><?php echo $text_lastname; ?></option>
                <?php } ?>
                <?php if ($position == 'email') { ?>
                <option value="email" selected="selected"><?php echo $text_email; ?></option>
                <?php } else { ?>
                <option value="email"><?php echo $text_email; ?></option>
                <?php } ?>
                <?php if ($position == 'telephone') { ?>
                <option value="telephone" selected="selected"><?php echo $text_telephone; ?></option>
                <?php } else { ?>
                <option value="telephone"><?php echo $text_telephone; ?></option>
                <?php } ?>
                <?php if ($position == 'fax') { ?>
                <option value="fax" selected="selected"><?php echo $text_fax; ?></option>
                <?php } else { ?>
                <option value="fax"><?php echo $text_fax; ?></option>
                <?php } ?>
                <?php if ($position == 'company') { ?>
                <option value="company" selected="selected"><?php echo $text_company; ?></option>
                <?php } else { ?>
                <option value="company"><?php echo $text_company; ?></option>
                <?php } ?>
                <?php if ($position == 'customer_group_id') { ?>
                <option value="customer_group_id" selected="selected"><?php echo $text_customer_group; ?></option>
                <?php } else { ?>
                <option value="customer_group_id"><?php echo $text_customer_group; ?></option>
                <?php } ?>
                <?php if ($position == 'address_1') { ?>
                <option value="address_1" selected="selected"><?php echo $text_address_1; ?></option>
                <?php } else { ?>
                <option value="address_1"><?php echo $text_address_1; ?></option>
                <?php } ?>
                <?php if ($position == 'address_2') { ?>
                <option value="address_2" selected="selected"><?php echo $text_address_2; ?></option>
                <?php } else { ?>
                <option value="address_2"><?php echo $text_address_2; ?></option>
                <?php } ?>
                <?php if ($position == 'city') { ?>
                <option value="city" selected="selected"><?php echo $text_city; ?></option>
                <?php } else { ?>
                <option value="city"><?php echo $text_city; ?></option>
                <?php } ?>
                <?php if ($position == 'postcode') { ?>
                <option value="postcode" selected="selected"><?php echo $text_postcode; ?></option>
                <?php } else { ?>
                <option value="postcode"><?php echo $text_postcode; ?></option>
                <?php } ?>
                <?php if ($position == 'country_id') { ?>
                <option value="country_id" selected="selected"><?php echo $text_country; ?></option>
                <?php } else { ?>
                <option value="country_id"><?php echo $text_country; ?></option>
                <?php } ?>
                <?php if ($position == 'zone_id') { ?>
                <option value="zone_id" selected="selected"><?php echo $text_zone; ?></option>
                <?php } else { ?>
                <option value="zone_id"><?php echo $text_zone; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="status">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
          </tr>
        </table>
        <table id="custom-field-value" class="table">
          <thead>
            <tr>
              <td class="left"><span class="required">*</span> <?php echo $entry_custom_value; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $custom_field_value_row = 0; ?>
          <?php foreach ($custom_field_values as $custom_field_value) { ?>
          <tbody id="custom-field-value-row<?php echo $custom_field_value_row; ?>">
            <tr>
              <td class="left"><input type="hidden" name="custom_field_value[<?php echo $custom_field_value_row; ?>][custom_field_value_id]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                <?php foreach ($languages as $language) { ?>
                <input type="text" name="custom_field_value[<?php echo $custom_field_value_row; ?>][custom_field_value_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($custom_field_value['custom_field_value_description'][$language['language_id']]) ? $custom_field_value['custom_field_value_description'][$language['language_id']]['name'] : ''; ?>" />
                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                <?php if (isset($error_custom_field_value[$custom_field_value_row][$language['language_id']])) { ?>
                <span class="error"><?php echo $error_custom_field_value[$custom_field_value_row][$language['language_id']]; ?></span>
                <?php } ?>
                <?php } ?></td>
              <td class="right"><input type="text" name="custom_field_value[<?php echo $custom_field_value_row; ?>][sort_order]" value="<?php echo $custom_field_value['sort_order']; ?>" size="1" /></td>
              <td class="left"><a onclick="$('#custom-field-value-row<?php echo $custom_field_value_row; ?>').remove();" class="btn"><i class="icon-minus-sign"></i> <?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $custom_field_value_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="2"></td>
              <td class="left"><a onclick="addCustomFieldValue();" class="btn"><i class="icon-plus-sign"></i> <?php echo $button_add_custom_field_value; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$('select[name=\'type\']').on('change', function() {
	if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox') {
		$('#custom-field-value').show();
		$('#display-value').hide();
	} else {
		$('#custom-field-value').hide();
		$('#display-value').show();
	}
	
	$('input[name=\'value\']').datepicker('destroy');
	
	if (this.value == 'date') {
		 $('input[name=\'value\']').datepicker({dateFormat: 'yy-mm-dd'});
	} else if (this.value == 'time') {
		$('input[name=\'value\']').timepicker({timeFormat: 'h:m'});	
	} else if (this.value == 'datetime') {
		$('input[name=\'value\']').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});	
	}
});

$('select[name=\'type\']').trigger('change');

var custom_field_value_row = <?php echo $custom_field_value_row; ?>;

function addCustomFieldValue() {
	html  = '<tbody id="custom-field-value-row' + custom_field_value_row + '">';
	html += '  <tr>';	
    html += '    <td class="left"><input type="hidden" name="custom_field_value[' + custom_field_value_row + '][custom_field_value_id]" value="" />';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" name="custom_field_value[' + custom_field_value_row + '][custom_field_value_description][<?php echo $language['language_id']; ?>][name]" value="" /> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
	html += '    </td>';
	html += '    <td class="right"><input type="text" name="custom_field_value[' + custom_field_value_row + '][sort_order]" value="" size="1" /></td>';
	html += '    <td class="left"><a onclick="$(\'#custom-field-value-row' + custom_field_value_row + '\').remove();" class="btn"><i class="icon-minus-sign"></i> <?php echo $button_remove; ?></a></td>';
	html += '  </tr>';	
    html += '</tbody>';
	
	$('#custom-field-value tfoot').before(html);
	
	custom_field_value_row++;
}
//--></script> 
<?php echo $footer; ?>