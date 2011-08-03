require 'orocos'
require 'readline'

include Orocos
Orocos.initialize


Orocos.run 'message_producer_deployment', 'message_consumer_deployment' do 

     message_producer = TaskContext.get 'message_producer'
     message_consumer = TaskContext.get 'message_consumer'

     message_producer.configure
     message_producer.start

     message_consumer.start

     message_producer.messages.connect_to message_consumer.messages

     Readline::readline("Press ENTER to exit\n") do
     end
end
