const initialState = {
  favorites: [],
  favorited: false
}

const favorites = (state = initialState, action) => {
  switch (action.type) {
    case 'ADD_FAVORITE':
      return {
        ...state,
        favorited: true
      }
    case 'FETCHING_FAVORITES':
      return {
        ...state,
        fetchingFavorites: true
      }
    case 'RECEIVED_FAVORITES':
      return {
        ...state,
        favorites: action.payload,
        fetchingFavorites: false
      }
    case 'REQUEST_FAVORITES_ERROR':
      return {
        ...state
      }
    case 'CHECK_FAVORITE_STATUS':
      return {
        ...state
      }
    case 'UPDATE_FAVORITE_STATUS':
      return {
        ...state,
        favorited: action.payload
      }
    case 'DELETE_FAVORITE':
      return {
        ...state,
        favorited: false
      }
    default:
      return state;
  }
}

export default favorites;