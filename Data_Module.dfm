object dm: Tdm
  Height = 550
  Width = 311
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = MemTable
    FieldDefs = <>
    Response = RESTResponse1
    Left = 128
    Top = 120
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 128
    Top = 192
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://pokeapi.glitch.me/v1/pokemon/6'
    Params = <>
    Left = 24
    Top = 24
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 120
    Top = 24
  end
  object RESTResponse1: TRESTResponse
    Left = 232
    Top = 16
  end
end
