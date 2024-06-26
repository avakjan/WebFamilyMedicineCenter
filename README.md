# Telegram Bot

Simple Telegram bot that sends the user's `chat_id` when receiving the `/start` command.

## How to Run

### Requirements

- Python 3.6+
- pip
- virtualenv

### Installation


1. **Activate the Virtual Environment**

    - On Windows:

        ```sh
        .\botenv\Scripts\Activate
        ```

    - On macOS and Linux:

        ```sh
        source botenv/bin/activate
        ```

2. **Install Dependencies**

    Install `python-telegram-bot` and any other dependencies required for your project.

    ```sh
    pip install python-telegram-bot==13.7
    ```

### Running the Bot

1. **Specify Your Bot Token**

    Open the `bot.py` file and replace `"YOUR_BOT_TOKEN"` with the token you received from @BotFather on Telegram.

    ```python
    updater = Updater("YOUR_BOT_TOKEN")
    ```

2. **Run the Script**

    Ensure the virtual environment is activated, then run the bot with the following command:

    ```sh
    python bot.py
    ```

Your bot should now be running and responding to the `/start` command in Telegram.

### Deactivating the Virtual Environment

To deactivate the virtual environment, use the command:

```sh
deactivate
