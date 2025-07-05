/**
 * {{copyright}}
 * @description 결제 관련 Apex 서비스 클래스
 * @group Billing
 */
public with sharing class PaymentService {
  /**
   * 총 결제 금액을 회차로 나눈다.
   * @param totalAmount 전체 금액
   * @param frequency 회차
   * @return 각 회차 금액
   */
  public static Decimal calculateInstallment(
    Decimal totalAmount,
    Integer frequency
  ) {
    return totalAmount.divide(frequency, 2, System.RoundingMode.HALF_UP);
  }
}
