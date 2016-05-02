import Constants from '/flux_app/constants'
import AppDispatcher from '/flux_app/app_dispatcher'

class CommentStore extends EventEmitter {
	constructor(){
		super();
		this._comments = [];

		AppDispatcher.register((payload) => {
			switch(payload.actionType){
				case Constants.ADD_COMMENT:
					this.addComment(payload.comment);
					this.emitChange();
					break;
				case Constants.SET_COMMENTS:
					this.setComments(payload.comments);
					this.emitChange();
					break;
				default:
					// NO-OP
			}
		});
	}

	setComments(comments){
		comments.forEach(comment => {
			this.addComment(comment);
		});
	}

	addComment(comment){
		this._comments[comment.id || this._comments.length] = comment;
	}

	comments(){
		return this._comments;
	}

	addChangeListener(callback){
		this.on(Constants.CHANGE_EVENT, callback);
	}

	removeChangeListener(callback){
		this.removeListener(Constants.CHANGE_EVENT, callback);
	}

	emitChange(){
		this.emit(Constants.CHANGE_EVENT);
	}
}

export default CommentStore;