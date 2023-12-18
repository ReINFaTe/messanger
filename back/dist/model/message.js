"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Message = void 0;
class Message {
    constructor(userId, username, text) {
        this.type = 'message';
        this.userId = userId;
        this.username = username;
        this.text = text;
    }
}
exports.Message = Message;
//# sourceMappingURL=message.js.map