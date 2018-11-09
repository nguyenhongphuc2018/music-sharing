class LikeButton extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      liked: true,
      user_like_song: {
        user_id: this.props.user_id,
        song_id: this.props.song_id
      },
      countLike: 0,
      is_liked: this.props.is_liked
    }
    this.handleClick = this.handleClick.bind(this)
    this.create = this.create.bind(this)
    this.destroy = this.destroy.bind(this)
  }
  
  create() {    
    let options = {
      method: "POST",
      body: JSON.stringify({
        user_id: this.props.user_id,
        song_id: this.props.song_id 
      }),
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": Rails.csrfToken()
      }
    }
    fetch("http://localhost:3000/likes", options)
    .then(response => {return response.json()})
    .then(() => this.setState)
    .catch(err => {console.log(err)})
  }

  destroy() {
    let options = {
      method: "DELETE",
      body: JSON.stringify({
        user_id: this.props.user_id,
        song_id: this.props.song_id 
      }),
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": Rails.csrfToken()
      }
    }
    let like_path = "http://localhost:3000/likes/".concat(this.props.song_id.toString())
    fetch(like_path, options)
    .then(response => {return response.json()})
    .then(data => {console.log(data)})
    .catch(err => {console.log(err)})
  }

  handleClick() {
    let {is_liked} = this.state
    if (!is_liked) {
      this.create()
      this.setState({
        is_liked: !this.state.is_liked,
        liked: !this.state.liked
      })
    } else {
      this.destroy()
      this.setState({
        is_liked: !this.state.is_liked,
        liked: !this.state.liked
      })
    }
  }

  render() {
    let {liked} = this.state
    
    if(liked) {
      buttonContext = "like"
    } else{
      buttonContext = "un-like"
    }

    return(
      <div>
        <div className="pull-left mr-4">
          <button onClick={this.handleClick} type="button" className="btn btn-default btn-xs">
            <i className="fa fa-heart"></i> {buttonContext}
          </button>
        </div>
        <span className="pull-right text-muted">
        </span>
      </div>
    )
  }
}
