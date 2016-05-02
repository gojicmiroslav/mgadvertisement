import Constants from '/flux_app/constants'
import AppDispatcher from '/flux_app/app_dispatcher'

class Actions {
	static addComment(params){
		AppDispatcher.dispatch({
			actionType: Constants.ADD_COMMENT,
			comment: params
		});
	}

	static setComments(params){
		AppDispatcher.dispatch({
			actionType: Constants.SET_COMMENTS,
			comments: params
		});
	}
}

export default Actions;