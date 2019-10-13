module SEPOMEX
  ZipCode =
    Struct.new(
      :zip_code,
      :settlement,
      :settlement_type,
      :municipality,
      :state,
      :city,
      :country
    )
end
