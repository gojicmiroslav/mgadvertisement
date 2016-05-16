import Constants from '/flux_app/constants'
import AppDispatcher from '/flux_app/app_dispatcher'
import Api from "/flux_app/api";

class Actions {
	constructor(advertisementId){
		this.advertisementId = advertisementId;
		this.watchInterval = setInterval(this.watch.bind(this), 1000);
	}

	addComment(params){
		Api.post(`/advertisements/${this.advertisementId}/comments`, {
			comment: params
		}).then(resp => {
			return resp.json();
		}).then(comment => {
			AppDispatcher.dispatch({
				actionType: Constants.ADD_COMMENT,
				comment: comment
			});
		});
	}

	setComments(params){
		AppDispatcher.dispatch({
			actionType: Constants.SET_COMMENTS,
			comments: params
		});
	}

	upvoteComment(comment){
		Api.put(`/advertisements/${this.advertisementId}/comments/${comment.id}/upvote`).then(function(resp){
			return resp.json();
		}).then(function(comment){
			AppDispatcher.dispatch({
				actionType: Constants.UPVOTE_COMMENT,
				comment: comment
			});
		});
	}

	watch() {
    Api.get(`/advertisements/${this.advertisementId}/comments`).then( comments => {
      this.setComments(comments);
    });
  }
}

export default Actions;