abstract class DeliverState{}

class DeliverInitial extends DeliverState{}

class DeliverNextSplash extends DeliverState{}

class DeliveryMessage extends DeliverState{
  String message;
  DeliveryMessage({required this.message});
}