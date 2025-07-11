class PalindromeChecker {
  static bool isPalindrome(String text) {
    if (text.isEmpty) return false;
    
    // Remove spaces and convert to lowercase
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    
    // Check if the string is equal to its reverse
    return cleanText == cleanText.split('').reversed.join('');
  }
}