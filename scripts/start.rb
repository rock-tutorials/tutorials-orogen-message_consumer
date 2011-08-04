require 'orocos'
require 'readline'

include Orocos
Nameservice::enable(:AVAHI, :searchdomains => [ '_robot._tcp'])
Orocos.initialize


Orocos.run 'message_consumer_deployment', :cmdline_args => { 'sd-domain' => '_robot._tcp'}, :wait => 3 do 

     message_producer = TaskContext.get 'message_producer'
     message_consumer = TaskContext.get 'message_consumer'

     message_consumer.start

     message_producer.messages.connect_to message_consumer.messages

     Readline::readline("Press ENTER to exit\n") do
     end
end
