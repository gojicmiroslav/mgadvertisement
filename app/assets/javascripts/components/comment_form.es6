class CommentForm extends React.Component {
	constructor(props){
		super();
		this.defaultState = { body: '', author: ''};
		this.state = this.defaultState;
	}

	static get PropTypes(){
		return {
			isReplying: React.PropTypes.bool,
			onCommentSubmitted: React.PropTypes.func,
			parent_id: React.PropTypes.number,
		};
	}

	static get contextTypes(){
    return {
      actions: React.PropTypes.func.isRequired
    }
  }

	onFieldChange(event){
		let prop = {};
		prop[event.target.name] = event.target.value;
		this.setState(prop);
	}

	submitComment(event){
		event.preventDefault();
		this.context.actions.addComment(_.merge(this.state, { parent_id: this.props.parent_id }));
		this.setState(this.defaultState);
		if(this.props.onCommentSubmitted){ // if the functions is declared
			this.props.onCommentSubmitted(); // then called it
		}
	}

	render(){
		return(
			<div>
				<form className={this.props.isReplying ? '' : 'hidden'}>
					<div className="form-group">
						<label>Author: </label>
						<input type="text" name="author" value={this.state.author} onChange={this.onFieldChange.bind(this)} className="form-control"/>
					</div>

					<div className="form-group">
						<label>Comment: </label>
						<textarea name="body" value={this.state.body} onChange={this.onFieldChange.bind(this)} className="form-control" />
					</div>
					<button type="submit" className="btn btn-primary" onClick={this.submitComment.bind(this)}>Submit</button>
				</form>
			</div>
		);
	}

}

export default CommentForm;