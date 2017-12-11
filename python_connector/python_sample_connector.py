import pusher

pusher_client = pusher.Pusher(
  app_id='your app id',
  key='your private key',
  secret='your secret key',
  cluster='your cluster location',
  ssl=True
)

pusher_client.trigger('my-channel', 'my-event', {'message': 'hello world'})
