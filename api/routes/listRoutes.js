module.exports = (app => {
    const server_lists = require('../controllers/rbxServerList')

    app.route('/list/:placeId')
       .get(server_lists.get_list);
});