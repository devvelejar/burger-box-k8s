'use strict';

module.exports.handler = async (event) => {
    try {
        return {
            statusCode: 200,
            body: JSON.stringify({"teste": "teste"}),
        };
    } catch (err) {
        return {
            statusCode: 500,
            body: JSON.stringify({ message: err.message }),
        };
    }
};
