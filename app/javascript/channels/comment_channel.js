import consumer from "./consumer"

if(location.pathname.match(/\/posts\/\d/)){
  consumer.subscriptions.create({
    channel: "CommentChannel",
    post_id: location.pathname.match(/\/posts\/(\d+)/)[1]
  }, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    <div class="post-box">
      ${data.comment.comment}
    </div>`
  const comments = document.getElementById("comments")
  comments.insertAdjacentHTML('afterbegin', html)
  const commentForm = document.getElementById("post")
  commentForm.reset();
  }
})
}