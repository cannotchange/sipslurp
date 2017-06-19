
$(document).ready(function() {
	var form_Ch_Pass = $("#form-ch-pwd");
	form_Ch_Pass.validate({
		rules: {
			password: { required: true },
			passwordConf: { required: true }
		},
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: {
			password: { required: "Please enter the Password" },
			passwordConf: { required: "Please enter the Confirm Password" }
		}
	});

	var form_Ch_Profile = $("#form-ch-profile");
	form_Ch_Profile.validate({
		rules: {
			fullname: { required: true }
		},
		errorElement: "div" ,
		errorClass:"text-danger",
		messages: {
			fullname: { required: "Please enter the Fullname" }
		}
	});

	var ppTag = $("#passwordA");
	var cpTag = $("#passwordConf");
	$("#btn-password").click(function() {
		if(form_Ch_Pass.valid()) {
			if($.trim(ppTag.val()) == $.trim(cpTag.val())) {
				form_Ch_Pass.submit();
			} else {
				cpTag.parent().find(".text-danger").remove();
				cpTag.parent().append('<div class="text-danger" for="confirmPwdUser" generated="true">Passwords donot Match</div>');
			}
		}
	});

	$("#btn-profile").click(function() {
		if(form_Ch_Profile.valid())
			form_Ch_Profile.submit();
	});
});
