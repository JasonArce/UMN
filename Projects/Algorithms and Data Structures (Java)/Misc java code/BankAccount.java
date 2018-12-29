public class BankAccount {
	public BankAccount(String initName, String initPassword, double initBalance) {
		this.name = initName;
		this.password = initPassword;
		this.balance = initBalance;
	}
	public void setPassword(String newPassword) {
		this.password = newPassword; 
		}
	public String getPassword() {
		return password;
	}
	private String name;
	private String password;
	double balance;
	
	public void withdraw(String enteredPassword, double amount) {
		// Only people with the right password and sufficient funds can withdraw
		if (password.equals(enteredPassword) && balance >= amount) {
			balance = balance - amount;
		}
	}
	
	public void deposit(String enteredPassword, double amount) {
		if (password.equals(enteredPassword)) {
			balance = balance + amount;
		}
	}
}
