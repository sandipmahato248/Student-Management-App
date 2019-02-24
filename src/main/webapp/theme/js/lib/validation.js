/*$("input").on("keydown", function(event) {
    this.oldValue = $(this).val();
});

$("input").on("input", function(event) {
    if (!this.validity.valueMissing) {
        if (!this.validity.valid) {
            var value = "" + $(this).val();
            switch ($(this).prop("type")) {
                case "number":
                    if (value.includes("e")) {
                        $(this).val(this.oldValue);
                        return;
                    } else if (isNaN(value)) {
                        value += "0";
                        if (isNaN(value)) {
                            $(this).val(this.oldValue);
                            return;
                        } else {
                            value = 0;
                        }
                    }
                    var min = $(this).prop("min");
                    var max = $(this).prop("max");
                    if (min.length > 0 && parseFloat(min) > parseFloat(value)) {
                        $(this).val(this.oldValue);
                        return;
                    } else if (max.length > 0 && parseFloat(max) < parseFloat(value)) {
                        $(this).val(this.oldValue);
                        return;
                    }
                    break;
                case "date":
                    LanguageUtil.VNIDate(this);
                    break;
                default:

                    if (this.validity.patternMismatch) {
                        $(this).val(this.oldValue);
                        return;
                    }

                    var maxlength = $(this).prop("maxlength");
                    if (maxlength.length > 0 && parseFloat(maxlength) < value.length) {
                        $(this).val(this.oldValue);
                        return;
                    }
            }
        } else if ($(this).hasClass("date-field")) {
            var value = "" + $(this).val();
            if (/^[0-9]{0,4}$/.test(value)) {
                this.validity.patternMismatch = true;
                console.log(this.validity.patternMismatch);
                return;
            } else if (/^[0-9]{4}\-$/.test(value)) {
                this.validity.patternMismatch = true;
                return;
            } else if (/^[0-9]{4}\-[0-9]{0,2}$/.test(value)) {
                this.validity.patternMismatch = true;
                return;
            } else if (/^[0-9]{4}\-[0-9]{2}\-$/.test(value)) {
                this.validity.patternMismatch = true;
                return;
            } else if (/^[0-9]{4}\-[0-9]{2}\-[0-9]{0,2}$/.test(value)) {
                if (/^[0-9]{4}\-[0-9]{2}\-[0-9]{2}$/.test(value)) {
                    this.validity.patternMismatch = false;
                } else {
                    this.validity.patternMismatch = true;
                }
                return;
            }
            $(this).val(this.oldValue);
            return;
        } else if () {
            if (parseFloat("0" + $(this).val()) > 1000000000) {
            $(this).val(this.oldValue);
            return;
        }
    }
    }

    var data = $(this).data();
    if (data.inputtype) {
        switch (data.inputtype) {
            case "date":
                LanguageUtil.VNIDate(this);
                break;
        }
    }

});

if (navigator.userAgent.indexOf('Chrome') != -1) {
    $('input[type=date]').on('click', function(event) {
        event.preventDefault();
    });
}

$("input").on("blur", function(event) {
    $(this).val(("" + $(this).val()).trim());
});*/

$(".nepali-date-picker").nepaliDatePicker({
    dateFormat: "%D, %M %d, %y",
    closeOnDateSelect: true,
    npdMonth: true,
    npdYear: true
});

$(".english-date-picker").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd'
});

$(document).on("change", ".english-date-picker", function(event) {
    if ($($(this).parents()[2]).hasClass("date-group")) {
        $($(this).parents()[2]).find(".nepali-date-picker").val(AD2BS($(this).val()));
    }
});
