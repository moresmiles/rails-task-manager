$(function(){
  $('#new_comment').submit(function(e){
    e.preventDefault();
    let values = $(this).serialize();
    let posting = $.post(this.action, values)
      posting.done(function(data) {
        let newComment = new Comment(data.id, data.user.email, data.content)
        $("#commentsTable tbody").append(newComment.renderComment());
      })
    $("#comment_content").val(" ");
  })
});

class Comment {
  constructor(id, email, content){
    this.id = id;
    this.email = email;
    this.content = content;
  }
  renderComment() {
    return `<tr><td>${this.email}</td><td>${this.content}</td><th><a href="/comments/${this.id}/edit">edit comment</a></th></tr>`;
  }
}
