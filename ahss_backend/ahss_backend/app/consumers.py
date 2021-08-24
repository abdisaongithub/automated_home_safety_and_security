import json
from channels.generic.websocket import AsyncWebsocketConsumer


class SensorConsumer(AsyncWebsocketConsumer):
    groups = ['broadcast']

    async def connect(self):
        # Todo: check if user is authenticated and and accept connection
        # Todo: sens all sensors data at first and push the rest of changes
        await self.accept()

    async def disconnect(self, close_code):
        # Leave room group
        await self.disconnect()

    # Receive message from WebSocket
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json['message']

        # Send message to WebSocket
        await self.send(text_data=json.dumps({
            'message': message
        }))

        # # Send message to room group
        # await self.channel_layer.group_send(
        #     {
        #         'type': 'sensors_message',
        #         'message': message
        #     }
        # )

    # Receive message from room group
    async def sensor_message(self, event):
        message = event['message']

        print(message)

        # Send message to WebSocket
        await self.send(text_data=json.dumps({
            'message': message
        }))
