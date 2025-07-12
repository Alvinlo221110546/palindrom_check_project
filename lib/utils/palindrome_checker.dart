class PalindromeChecker {
  static bool isPalindrome(String text) {
    if (text.isEmpty) return false;
    
    String cleanText = text.replaceAll(' ', '').toLowerCase();
    
    return cleanText == cleanText.split('').reversed.join('');
  }
}