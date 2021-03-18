	$(document)
				.ready(
						function() {

							//alert("i m loaded bro..");
							//when form is submitted this function will invoke
							$("#do-post-form")
									.on(
											"submit",
											function(event) {

												event.preventDefault();
												console
														.log("submit is clicked");
												let form = new FormData(this);

												$
														.ajax({

															url : "DoPostServlet",
															type : "POST",
															data : form,

															success : function(
																	data,
																	textStatus,
																	jqXHR) {

																//SUCCESS MSG
																console
																		.log(data);

																if (data.trim() == 'done') {
																	//success sweetalert	
																	swal(
																			"Good job!",
																			"You clicked the button!",
																			"success");
																} else {
																	//error sweetalert
																	swal(
																			"error!",
																			"You clicked the button!",
																			"error");
																}

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//ERROR MSG
																//error sweetalert
																swal(
																		"error!",
																		"You clicked the button!",
																		"error");

															},
															processData : false,
															contentType : false

														});

											});
						});
	