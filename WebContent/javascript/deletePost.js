 function deletePost(bid){
	   //console.log(bid);
	   
	   swal({
		   title: "Are you sure?",
		   text: "Once deleted, you will not be able to recover this imaginary file!",
		   icon: "warning",
		   buttons: true,
		   dangerMode: true,
		 })
		 .then((willDelete) => {
		   if (willDelete) {
		   
			   var d = {

						bid: bid,
					}

			   
			$.ajax({
				
				url:"DeleteBlogServlet",
				data:d,
				
				success: function(data, textStatus, jqXHR) {
					if (data.trim() == "done") {
						swal("post Deleted successfuly","","success")
						.then((value) => {
						window.location="your_posts.jsp";
						 
						});
					   
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(data);
					
					swal("Something went wrong!", "Try again letter", "Error");
					window.location="your_posts.jsp";
				}
				
			});   
			   
			   
		   } else {
		   
		   
			  	   }
		 });
	   
	   
	   
   }/**
 * 
 */