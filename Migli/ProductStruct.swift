// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let totalHits: Int
    let facets: Facets
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
        case facets, products
    }
}

// MARK: - Facets
struct Facets: Codable {
    let purchasableOnline, retailer, discount, label: DiscountClass
    let brand: DiscountClass

    enum CodingKeys: String, CodingKey {
        case purchasableOnline = "purchasable_online"
        case retailer, discount, label, brand
    }
}

// MARK: - DiscountClass
struct DiscountClass: Codable {
    let name: String
    let terms: [Term]
}

// MARK: - Term
struct Term: Codable {
    let term: String
    let count: Int
    let name: String
    let active: Bool
    let slug: String
}

// MARK: - Product
struct Product: Codable {
    let id: String
    let language: Language
    let name, slug, bossNumber: String
    let productDescription: Description?
    let tags: [Tag]
    let isVariant: Bool
    let gtins: [String]
    let brand: ProductBrand?
    let categories: [Category]
    let features: [Feature]
    let image: ImageElement
    let internalFeatures: [InternalFeature]
    let vat: Vat
    let links: Links
    let updatedAt: Date
    let receiptText: String
    let price: Price
    let retailer: Retailer
    let reindexDate: Date
    let imageTransparent: ImageElement?
    let ratings: Ratings?
    let warrantyMonths: Int?
    let productType: String?
    let additionalImages: [ImageElement]?
    let eyecatchers: [Eyecatcher]?

    enum CodingKeys: String, CodingKey {
        case id, language, name, slug
        case bossNumber = "boss_number"
        case productDescription = "description"
        case tags
        case isVariant = "is_variant"
        case gtins, brand, categories, features, image
        case internalFeatures = "internal_features"
        case vat, links
        case updatedAt = "updated_at"
        case receiptText = "receipt_text"
        case price, retailer
        case reindexDate = "reindex_date"
        case imageTransparent = "image_transparent"
        case ratings
        case warrantyMonths = "warranty_months"
        case productType = "product_type"
        case additionalImages = "additional_images"
        case eyecatchers
    }
}

// MARK: - ImageElement
struct ImageElement: Codable {
    let original: String
    let stack: String
}

// MARK: - ProductBrand
struct ProductBrand: Codable {
    let id, name, slug: String
    let image: ImageElement
}

// MARK: - Category
struct Category: Codable {
    let code, name, slug: String
    let visible: Bool
    let parentCode: String
    let level: Int
    let title: String?
    let image: ImageElement?

    enum CodingKeys: String, CodingKey {
        case code, name, slug, visible
        case parentCode = "parent_code"
        case level, title, image
    }
}

// MARK: - Eyecatcher
struct Eyecatcher: Codable {
    let valueCode, labelCode, eyecatcherDescription: String
    let image: EyecatcherImage

    enum CodingKeys: String, CodingKey {
        case valueCode = "value_code"
        case labelCode = "label_code"
        case eyecatcherDescription = "description"
        case image
    }
}

// MARK: - EyecatcherImage
struct EyecatcherImage: Codable {
    let original: String
    let code, imageDescription, stack: String

    enum CodingKeys: String, CodingKey {
        case original, code
        case imageDescription = "description"
        case stack
    }
}

// MARK: - Feature
struct Feature: Codable {
    let labelCode, label: String
    let values: [Value]
    let topFact: Bool
    let unitCode, unit, unitSymbol: String?

    enum CodingKeys: String, CodingKey {
        case labelCode = "label_code"
        case label, values
        case topFact = "top_fact"
        case unitCode = "unit_code"
        case unit
        case unitSymbol = "unit_symbol"
    }
}

// MARK: - Value
struct Value: Codable {
    let valueCode: String?
    let value: String
    let numericValue: Double?
    let booleanValue: Bool?

    enum CodingKeys: String, CodingKey {
        case valueCode = "value_code"
        case value
        case numericValue = "numeric_value"
        case booleanValue = "boolean_value"
    }
}

// MARK: - InternalFeature
struct InternalFeature: Codable {
    let labelCode: String
    let label: String?
    let values: [Value]
    let topFact: Bool

    enum CodingKeys: String, CodingKey {
        case labelCode = "label_code"
        case label, values
        case topFact = "top_fact"
    }
}

enum Language: String, Codable {
    case de = "de"
}

// MARK: - Links
struct Links: Codable {
    let migrosCh, migipedia: Doitgarden
    let doitgarden, melectronics: Doitgarden?

    enum CodingKeys: String, CodingKey {
        case migrosCh = "migros_ch"
        case migipedia, doitgarden, melectronics
    }
}

// MARK: - Doitgarden
struct Doitgarden: Codable {
    let url: String
    let name: DoitgardenName
    let canonical: String
    let type: TypeEnum
    let purchasable: Bool
}

enum DoitgardenName: String, Codable {
    case doItGarden = "Do It + Garden"
    case melectronics = "melectronics"
    case migipedia = "Migipedia"
    case migrosCh = "migros.ch"
}

enum TypeEnum: String, Codable {
    case info = "info"
    case shop = "shop"
}

// MARK: - Price
struct Price: Codable {
    let validFrom, validTo: Date
    let currency: Currency
    let source: Source
    let item: Item
    let base: Base?

    enum CodingKeys: String, CodingKey {
        case validFrom = "valid_from"
        case validTo = "valid_to"
        case currency, source, item, base
    }
}

// MARK: - Base
struct Base: Codable {
    let price: Double
    let quantity: Int
    let unit: String
}

enum Currency: String, Codable {
    case chf = "CHF"
}

// MARK: - Item
struct Item: Codable {
    let price: Double
    let quantity: Int
    let unit: Unit
    let varyingQuantity: Bool
    let displayQuantity: String?

    enum CodingKeys: String, CodingKey {
        case price, quantity, unit
        case varyingQuantity = "varying_quantity"
        case displayQuantity = "display_quantity"
    }
}

enum Unit: String, Codable {
    case cu = "CU"
}

enum Source: String, Codable {
    case priceRepository = "PriceRepository"
}

// MARK: - Description
struct Description: Codable {
    let text, source: String
}

// MARK: - Ratings
struct Ratings: Codable {
    let countAll: Int
    let averageAll: Double

    enum CodingKeys: String, CodingKey {
        case countAll = "count_all"
        case averageAll = "average_all"
    }
}

// MARK: - Retailer
struct Retailer: Codable {
    let id: ID
    let name: RetailerName
}

enum ID: String, Codable {
    case doitgarden = "doitgarden"
    case melectronics = "melectronics"
    case supermarkt = "supermarkt"
}

enum RetailerName: String, Codable {
    case doItGarden = "Do It + Garden"
    case melectronics = "melectronics"
    case supermarkt = "Supermarkt"
}

enum Tag: String, Codable {
    case migipedia = "migipedia"
    case sourcePIM = "source-pim"
    case sourcePex = "source-pex"
    case validityRangeNotSet = "validity-range-not-set"
    case viewBrowseAllRetailersPartial = "view-browse-all-retailers-partial"
    case viewBrowsePartial = "view-browse-partial"
}

// MARK: - Vat
struct Vat: Codable {
    let id: Int
    let percentage: Double
}
