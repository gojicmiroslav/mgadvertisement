class CommentForm extends React.Component {
	constructor(){
		super();
		this.defaultState = { body: '', author: ''};
		this.state = this.defaultState;
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
		this.context.actions.addComment(this.state);
		this.setState(this.defaultState);
	}

	render(){
		return(
			<div>
				<form>
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