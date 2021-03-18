function doLike(bid, uid) {

	console.log(bid + " , " + uid);

	var d = {

		bid: bid,
		uid: uid,
		operation: 'like'


	}

	$.ajax({

		url: "LikeServlet",
		data: d,

		success: function(data, textStatus, jqXHR) {
			console.log(data);

			if (data.trim() == "liked") {
				let c = $(".like-counter").html();
				c++;
				$(".like-counter").html(c);
			}
			if (data.trim() == "disliked") {
				let c = $(".like-counter").html();
				c--;
				
				$(".like-counter").html(c);
			}

		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(data);
		}

	})

}