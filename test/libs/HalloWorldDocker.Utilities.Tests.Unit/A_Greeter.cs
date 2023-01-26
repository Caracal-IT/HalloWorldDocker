// ReSharper disable InconsistentNaming



namespace HalloWorldDocker.Utilities.Tests.Unit;

public class A_Greeter {
  private readonly Greeter _greeter;
  
  public A_Greeter() {
    _greeter = new Greeter();
  }

  [Fact]
  public void Should_Return_Welcome_Message() {
    // Arrange
    var bob = "Bob";
    
    // Act
    var message = _greeter.Greet(bob);
    
    // Assert
    message.Should().Be( $"Good morning {bob}");
  }
}