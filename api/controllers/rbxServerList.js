const axios = require('axios');

exports.get_list = (async (req, res) => {
    const type = req.query.type || 'Public';
    const order = 'Asc';
    const limit = req.query.limit || '10'
    const cursor = req.query.cursor || ''

    const list_data = await axios.get(
        `https://games.roblox.com/v1/games/${req.params.placeId}/servers/${type}?sortOrder=${order}&limit=${limit}&cursor=${cursor}`
    );

    res.send(list_data.data);
});