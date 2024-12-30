let repCommentId = null; // This will hold the ID of the comment being replied to

// Function to handle adding a comment (or reply)
function comment(idPost) {
	let comment = document.getElementById('comment-input' + idPost).value;

	$.ajax({
		url: "/PostComment/" + idPost,
		type: "POST",
		contentType: "application/json", // Set content type to JSON
		data: JSON.stringify({
			commentContent: comment,
			repCommentIdUser: repCommentId || "" // Send the reply ID or empty string
		}),
		success: function(data) {
			// Clear the input field and reset the reply ID
			console.log(data)
			document.getElementById('comment-input' + idPost).value = "";
			repCommentId = null; // Reset the reply ID after submission

			// Dynamically append the new comment to the comment list
			appendCommentToPost(idPost, data);
		},
		error: function(xhr, status, error) {
			console.log("Error Status: " + xhr.status);
			console.log("Error Response: " + xhr.responseText);
		}
	});
}

// Function to handle setting the reply comment
function repComment(idComment, userName, idPost) {
	let comment = document.getElementById('comment-input' + idPost);
	comment.value = "@" + userName + " "; // Populate the comment input with "@username"
	comment.focus(); // Focus the input box
	repCommentId = idComment; // Set the ID of the comment being replied to
}

// Function to append a newly created comment to the post's comment list
function appendCommentToPost(idPost, newComment) {
	let commentList = document.getElementById('first-comment'); // Assuming you have a container to hold the comments
	let commentElement = document.createElement('div');

	commentElement.classList.add('comment__card');
	commentElement.innerHTML = `
        <div class="box-top">
            <div class="Profile">
                <div class="profile-image">
                    <img src="${newComment.avatar}" id="imgUserComment">
                </div>
                <div class="Name">
                    <strong>${newComment.fullname}</strong>
                    <span>${newComment.dateComment}</span>
                </div>
            </div>
        </div>
        <p>${newComment.content}</p>
        <div class="comment__card-footer">
            <div onclick="repComment('${newComment.ID}', '${newComment.fullname}', '${idPost}')">Reply</div>
        </div>
    `;

	commentList.appendChild(commentElement); // Append the new comment to the list
}

// Function to load more replies (existing function)
function seenMore(idComment) {
	$.ajax({
		url: "/loadReplyComment",
		type: "GET",
		data: {
			idComment: idComment
		},
		success: function(data) {
			let row = document.getElementById('replyContentComment' + idComment);
			row.innerHTML = data;
		},
		error: function(xhr) {
			alert("Error: " + xhr.status);
		}
	});
}
