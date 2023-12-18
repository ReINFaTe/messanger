export class Message {
    type: String = 'message';

    userId: String;
    username: String;
    text: String;

    constructor(userId: String, username: String, text: String) {
        this.userId = userId;
        this.username = username;
        this.text = text;
    }
}