//
//  HealthKitError.swift
//  CoreHealthKitManagerInterface
//
//  Created by 박현우 on 2023/06/05.
//

import Foundation

public enum HealthKitError: Error {
    
    case queryFailed(error: Error)
    /// Healhkit query 결과가 비어있습니다.
    case dataNotFound
    /// 애플워치 데이터가 없습니다.
    case watchDataNotFound
    /// StatisticsSample 합산 계산 실패 오류입니다.
    case sumQuentityFailed
    
    var description: String {
        switch self {
        case .queryFailed:
            return "Sample을 가져오는데 실패했습니다. 건강 데이터에 대한 접근 권한 및 디바이스 상태를 확인해주세요."
        case .dataNotFound:
            return "query는 성공했으나, 값이 비어있습니다."
        case .watchDataNotFound:
            return "애플워치 데이터가 없습니다"
        case .sumQuentityFailed:
            return "StatisticsSample의 sumQuentity()를 호출할 수 없습니다."
        }
    }
}
