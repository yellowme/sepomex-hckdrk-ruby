module SEPOMEX
  PostalCode =
    Struct.new(
      :cp,
      :settlement,
      :settlement_type,
      :municipality,
      :state,
      :city,
      :country
    )
end
