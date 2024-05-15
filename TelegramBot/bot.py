from telegram import ReplyKeyboardMarkup, KeyboardButton
from telegram.ext import CommandHandler, MessageHandler, Filters, Updater, CallbackContext
from telegram.update import Update
import requests
from requests.auth import HTTPBasicAuth
import json

def start(update: Update, context: CallbackContext):
    user = update.effective_user
    context.bot.send_message(chat_id=update.effective_chat.id, 
                             text=f"Hello, {user.first_name}! I am a bot developed for Web Family medicine center where you can access your related data and get reminders about events",
                             reply_markup=get_keyboard())

def get_keyboard():
    button1 = KeyboardButton('My chat id')
    button2 = KeyboardButton('Upcoming visits')
    button3 = KeyboardButton('Get my image')
    
    keyboard = ReplyKeyboardMarkup([[button1], [button2], [button3]], resize_keyboard=True)
    return keyboard

def get_visits(chat_id):
    chat_id_str = str(chat_id)
    url = "https://itb2204.bc365.eu:7048/bc/api/student/veebiarstikeskus/v2.0/companies(34f95556-b4bd-ee11-907c-6045bdc8dfac)/upcomingVisits?$expand=patient&$filter=telegramChatId eq '" + chat_id_str + "'&tenant=VeebiArstiKeskus"
    response = requests.get(url, auth=HTTPBasicAuth('dmdere', 'ITB2204k2x!'))

    if response.status_code == 200:
        try:
            return response.json()
        except json.decoder.JSONDecodeError:
            return "Error decoding JSON. The server response is not JSON."
    else:
        return f"Error: response status {response.status_code}."

def button_click(update: Update, context: CallbackContext):
    text = update.message.text
    chat_id = update.effective_chat.id
    
    if text == 'My chat id':
        context.bot.send_message(chat_id=chat_id, text=f"Your chat_id is: {chat_id}")
    elif text == 'Upcoming visits':
        visits_info = get_visits(chat_id)
        if isinstance(visits_info, str):
            context.bot.send_message(chat_id=chat_id, text=visits_info)
        else:
            formatted_visits = format_visits_info(visits_info)
            context.bot.send_message(chat_id=chat_id, text=formatted_visits)
    elif text == 'Get my image':
        handle_get_my_image(chat_id, context)

def handle_get_my_image(chat_id, context):
    url = f"https://itb2204.bc365.eu:7048/bc/api/student/veebiarstikeskus/v2.0/companies(34f95556-b4bd-ee11-907c-6045bdc8dfac)/familyCenters?tenant=VeebiArstiKeskus&filter=telegramChatId eq '{chat_id}'"
    response = requests.get(url, auth=HTTPBasicAuth('dmdere', 'ITB2204k2x!'))

    if response.status_code == 200:
        image_url = response.json().get('image_url')
        context.bot.send_photo(chat_id=chat_id, photo=image_url)
    else:
        context.bot.send_message(chat_id=chat_id, text="Failed to fetch image.")

def format_visits_info(visits_info):
    if "value" in visits_info:
        visits = visits_info["value"]
        formatted_visits_list = []
        for visit in visits:
            description = visit.get("description", "No description provided")
            date = visit.get("date", "No date provided")
            is_online = "Yes" if visit.get("isOnline", False) else "No"
            patient_name = f"{visit['patient']['firstname']} {visit['patient']['lastname']}"
            email = visit["patient"].get("email", "No email provided")
            phone_number = visit["patient"].get("phoneNumber", "No phone number provided")
            visit_details = (
                f"Visit Details:\n"
                f"- Description: {description}\n"
                f"- Date: {date}\n"
                f"- Is Online: {is_online}\n"
                f"- Patient Name: {patient_name}\n"
                f"- Email: {email}\n"
                f"- Phone Number: {phone_number}\n"
            )
            formatted_visits_list.append(visit_details)
        
        return "\n".join(formatted_visits_list)
    else:
        return "No upcoming visits found."
def main():
    updater = Updater("7067360112:AAEMbia5tUgfHIy-SRYe9JxISeihWvzctbs", use_context=True)
    
    dp = updater.dispatcher
    dp.add_handler(CommandHandler("start", start))
    dp.add_handler(MessageHandler(Filters.text & ~Filters.command, button_click))
    
    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()
