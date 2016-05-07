import CommentForm from '/components/comment_form';
import CommentList from '/components/comment_list';

class Comment extends React.Component {
  static get propTypes(){
    return {
      id: React.PropTypes.number,
      author: React.PropTypes.string,
      body: React.PropTypes.string,
      rank: React.PropTypes.number
    }
  }

  constructor(){
    super();
    this.state = { isReplying: false };
  }

  onToggleReply(){
    this.setState({ isReplying: !this.state.isReplying });
  }

  onCommentSubmitted(event){
    this.setState({ isReplying: false });
  }

  render(){
    const replyText = this.state.isReplying ? 'Hide' : 'Reply';
    return (
      <li className="comment">
        <div className="panel panel-default">
          <div className="panel-heading">
            <p><b>Posted:</b> { this.props.created_at }</p>
            <p className="text-primary"><b>Author: <i>{this.props.author}</i></b></p>
          </div>
          <div className="panel-body">
            {this.props.body} <hr />
            <button className="btn btn-info btn-sm" onClick={this.onToggleReply.bind(this)}>
              {replyText}
            </button>
            <CommentForm 
              parent_id={this.props.id} 
              isReplying={this.state.isReplying} 
              // this - parent context 
              onCommentSubmitted={this.onCommentSubmitted.bind(this)}
              />
            <CommentList parent_id={this.props.id} />
          </div>
        </div>
      </li>
    );
  }
}
 
export default Comment; 	

  
