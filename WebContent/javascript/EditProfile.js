$(document).ready(function() {

			//alert("page is loaded");

			let edit_status = false;

			$("#edit-profile-btn").click(function() {

				if (edit_status == false) {
					$("#edit-profile").show();
					$("#profile-details").hide();

					$(this).text = "Back";
					edit_status = true;
				} else {
					$("#edit-profile").hide();
					$("#profile-details").show();
					edit_status = false;

				}
			});

		});/**
 * 
 */