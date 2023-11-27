class MixinRegister {}

class AddMixinClasses extends MixinRegister
    with RegisterAccount, RegisterAccountDio {}

class ApplyMixinRegister {
  AddMixinClasses? addMixinClasses;

  ApplyMixinRegister() {
    addMixinClasses = AddMixinClasses();
  }
  void resultUsingModel() {
    addMixinClasses!.connectToDB();
  }

  void resultUsingDio() {
    addMixinClasses!.connectToDatabase();
  }
}

mixin RegisterAccount on MixinRegister {
  // Here we use Model Class
  void connectToDB() {}
}

mixin RegisterAccountDio on MixinRegister {
  //Here we use Dio
  void connectToDatabase() {}
}
