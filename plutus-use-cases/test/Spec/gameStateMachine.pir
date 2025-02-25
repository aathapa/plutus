(program
  (let
    (nonrec)
    (datatypebind
      (datatype
        (tyvardecl These (fun (type) (fun (type) (type))))
        (tyvardecl a (type)) (tyvardecl b (type))
        These_match
        (vardecl That (fun b [[These a] b]))
        (vardecl These (fun a (fun b [[These a] b])))
        (vardecl This (fun a [[These a] b]))
      )
    )
    (datatypebind
      (datatype
        (tyvardecl Tuple2 (fun (type) (fun (type) (type))))
        (tyvardecl a (type)) (tyvardecl b (type))
        Tuple2_match
        (vardecl Tuple2 (fun a (fun b [[Tuple2 a] b])))
      )
    )
    (let
      (rec)
      (datatypebind
        (datatype
          (tyvardecl List (fun (type) (type)))
          (tyvardecl a (type))
          Nil_match
          (vardecl Nil [List a]) (vardecl Cons (fun a (fun [List a] [List a])))
        )
      )
      (let
        (nonrec)
        (datatypebind
          (datatype (tyvardecl Unit (type))  Unit_match (vardecl Unit Unit))
        )
        (datatypebind
          (datatype
            (tyvardecl Bool (type))

            Bool_match
            (vardecl True Bool) (vardecl False Bool)
          )
        )
        (let
          (rec)
          (termbind
            (nonstrict)
            (vardecl
              fEqData_c
              (all a (type) (fun [(lam a (type) (fun a (fun a Bool))) a] (fun [List a] (fun [List a] Bool))))
            )
            (abs
              a
              (type)
              (lam
                dEq
                [(lam a (type) (fun a (fun a Bool))) a]
                (lam
                  ds
                  [List a]
                  (lam
                    ds
                    [List a]
                    [
                      [
                        [
                          { [ { Nil_match a } ds ] (fun Unit Bool) }
                          (lam
                            thunk
                            Unit
                            [
                              [
                                [
                                  { [ { Nil_match a } ds ] (fun Unit Bool) }
                                  (lam thunk Unit True)
                                ]
                                (lam
                                  ipv
                                  a
                                  (lam ipv [List a] (lam thunk Unit False))
                                )
                              ]
                              Unit
                            ]
                          )
                        ]
                        (lam
                          x
                          a
                          (lam
                            xs
                            [List a]
                            (lam
                              thunk
                              Unit
                              [
                                [
                                  [
                                    { [ { Nil_match a } ds ] (fun Unit Bool) }
                                    (lam thunk Unit False)
                                  ]
                                  (lam
                                    y
                                    a
                                    (lam
                                      ys
                                      [List a]
                                      (lam
                                        thunk
                                        Unit
                                        [
                                          [
                                            [
                                              {
                                                [ Bool_match [ [ dEq x ] y ] ]
                                                (fun Unit Bool)
                                              }
                                              (lam
                                                thunk
                                                Unit
                                                [
                                                  [ [ { fEqData_c a } dEq ] xs ]
                                                  ys
                                                ]
                                              )
                                            ]
                                            (lam thunk Unit False)
                                          ]
                                          Unit
                                        ]
                                      )
                                    )
                                  )
                                ]
                                Unit
                              ]
                            )
                          )
                        )
                      ]
                      Unit
                    ]
                  )
                )
              )
            )
          )
          (let
            (nonrec)
            (termbind
              (strict)
              (vardecl
                equalsInteger (fun (con integer) (fun (con integer) Bool))
              )
              (lam
                arg
                (con integer)
                (lam
                  arg
                  (con integer)
                  [
                    (lam
                      b
                      (con bool)
                      [ [ [ { (builtin ifThenElse) Bool } b ] True ] False ]
                    )
                    [ [ (builtin equalsInteger) arg ] arg ]
                  ]
                )
              )
            )
            (termbind
              (strict)
              (vardecl
                equalsByteString
                (fun (con bytestring) (fun (con bytestring) Bool))
              )
              (lam
                arg
                (con bytestring)
                (lam
                  arg
                  (con bytestring)
                  [
                    (lam
                      b
                      (con bool)
                      [ [ [ { (builtin ifThenElse) Bool } b ] True ] False ]
                    )
                    [ [ (builtin equalsByteString) arg ] arg ]
                  ]
                )
              )
            )
            (let
              (rec)
              (datatypebind
                (datatype
                  (tyvardecl Data (type))

                  Data_match
                  (vardecl B (fun (con bytestring) Data))
                  (vardecl Constr (fun (con integer) (fun [List Data] Data)))
                  (vardecl I (fun (con integer) Data))
                  (vardecl List (fun [List Data] Data))
                  (vardecl Map (fun [List [[Tuple2 Data] Data]] Data))
                )
              )
              (let
                (rec)
                (termbind
                  (nonstrict)
                  (vardecl fEqData_c (fun Data (fun Data Bool)))
                  (lam
                    ds
                    Data
                    (lam
                      ds
                      Data
                      [
                        [
                          [
                            [
                              [
                                { [ Data_match ds ] Bool }
                                (lam
                                  b
                                  (con bytestring)
                                  [
                                    [
                                      [
                                        [
                                          [
                                            [
                                              {
                                                [ Data_match ds ]
                                                (fun Unit Bool)
                                              }
                                              (lam
                                                b
                                                (con bytestring)
                                                (lam
                                                  thunk
                                                  Unit
                                                  [ [ equalsByteString b ] b ]
                                                )
                                              )
                                            ]
                                            (lam
                                              default_arg0
                                              (con integer)
                                              (lam
                                                default_arg1
                                                [List Data]
                                                (lam thunk Unit False)
                                              )
                                            )
                                          ]
                                          (lam
                                            default_arg0
                                            (con integer)
                                            (lam thunk Unit False)
                                          )
                                        ]
                                        (lam
                                          default_arg0
                                          [List Data]
                                          (lam thunk Unit False)
                                        )
                                      ]
                                      (lam
                                        default_arg0
                                        [List [[Tuple2 Data] Data]]
                                        (lam thunk Unit False)
                                      )
                                    ]
                                    Unit
                                  ]
                                )
                              ]
                              (lam
                                i
                                (con integer)
                                (lam
                                  ds
                                  [List Data]
                                  [
                                    [
                                      [
                                        [
                                          [
                                            [
                                              {
                                                [ Data_match ds ]
                                                (fun Unit Bool)
                                              }
                                              (lam
                                                default_arg0
                                                (con bytestring)
                                                (lam thunk Unit False)
                                              )
                                            ]
                                            (lam
                                              i
                                              (con integer)
                                              (lam
                                                ds
                                                [List Data]
                                                (lam
                                                  thunk
                                                  Unit
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Bool_match
                                                            [
                                                              [
                                                                equalsInteger i
                                                              ]
                                                              i
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  fEqData_c Data
                                                                }
                                                                fEqData_c
                                                              ]
                                                              ds
                                                            ]
                                                            ds
                                                          ]
                                                        )
                                                      ]
                                                      (lam thunk Unit False)
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                          (lam
                                            default_arg0
                                            (con integer)
                                            (lam thunk Unit False)
                                          )
                                        ]
                                        (lam
                                          default_arg0
                                          [List Data]
                                          (lam thunk Unit False)
                                        )
                                      ]
                                      (lam
                                        default_arg0
                                        [List [[Tuple2 Data] Data]]
                                        (lam thunk Unit False)
                                      )
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            ]
                            (lam
                              i
                              (con integer)
                              [
                                [
                                  [
                                    [
                                      [
                                        [
                                          { [ Data_match ds ] (fun Unit Bool) }
                                          (lam
                                            default_arg0
                                            (con bytestring)
                                            (lam thunk Unit False)
                                          )
                                        ]
                                        (lam
                                          default_arg0
                                          (con integer)
                                          (lam
                                            default_arg1
                                            [List Data]
                                            (lam thunk Unit False)
                                          )
                                        )
                                      ]
                                      (lam
                                        i
                                        (con integer)
                                        (lam
                                          thunk Unit [ [ equalsInteger i ] i ]
                                        )
                                      )
                                    ]
                                    (lam
                                      default_arg0
                                      [List Data]
                                      (lam thunk Unit False)
                                    )
                                  ]
                                  (lam
                                    default_arg0
                                    [List [[Tuple2 Data] Data]]
                                    (lam thunk Unit False)
                                  )
                                ]
                                Unit
                              ]
                            )
                          ]
                          (lam
                            ls
                            [List Data]
                            [
                              [
                                [
                                  [
                                    [
                                      [
                                        { [ Data_match ds ] (fun Unit Bool) }
                                        (lam
                                          default_arg0
                                          (con bytestring)
                                          (lam thunk Unit False)
                                        )
                                      ]
                                      (lam
                                        default_arg0
                                        (con integer)
                                        (lam
                                          default_arg1
                                          [List Data]
                                          (lam thunk Unit False)
                                        )
                                      )
                                    ]
                                    (lam
                                      default_arg0
                                      (con integer)
                                      (lam thunk Unit False)
                                    )
                                  ]
                                  (lam
                                    ls
                                    [List Data]
                                    (lam
                                      thunk
                                      Unit
                                      [
                                        [ [ { fEqData_c Data } fEqData_c ] ls ]
                                        ls
                                      ]
                                    )
                                  )
                                ]
                                (lam
                                  default_arg0
                                  [List [[Tuple2 Data] Data]]
                                  (lam thunk Unit False)
                                )
                              ]
                              Unit
                            ]
                          )
                        ]
                        (lam
                          ds
                          [List [[Tuple2 Data] Data]]
                          [
                            [
                              [
                                [
                                  [
                                    [
                                      { [ Data_match ds ] (fun Unit Bool) }
                                      (lam
                                        default_arg0
                                        (con bytestring)
                                        (lam thunk Unit False)
                                      )
                                    ]
                                    (lam
                                      default_arg0
                                      (con integer)
                                      (lam
                                        default_arg1
                                        [List Data]
                                        (lam thunk Unit False)
                                      )
                                    )
                                  ]
                                  (lam
                                    default_arg0
                                    (con integer)
                                    (lam thunk Unit False)
                                  )
                                ]
                                (lam
                                  default_arg0
                                  [List Data]
                                  (lam thunk Unit False)
                                )
                              ]
                              (lam
                                ds
                                [List [[Tuple2 Data] Data]]
                                (lam
                                  thunk
                                  Unit
                                  [
                                    [
                                      [ { fEqData_c [[Tuple2 Data] Data] } dEq ]
                                      ds
                                    ]
                                    ds
                                  ]
                                )
                              )
                            ]
                            Unit
                          ]
                        )
                      ]
                    )
                  )
                )
                (termbind
                  (strict)
                  (vardecl
                    dEq
                    (fun [[Tuple2 Data] Data] (fun [[Tuple2 Data] Data] Bool))
                  )
                  (lam
                    ds
                    [[Tuple2 Data] Data]
                    (lam
                      ds
                      [[Tuple2 Data] Data]
                      [
                        { [ { { Tuple2_match Data } Data } ds ] Bool }
                        (lam
                          a
                          Data
                          (lam
                            b
                            Data
                            [
                              { [ { { Tuple2_match Data } Data } ds ] Bool }
                              (lam
                                a
                                Data
                                (lam
                                  b
                                  Data
                                  [
                                    [
                                      [
                                        {
                                          [ Bool_match [ [ fEqData_c a ] a ] ]
                                          (fun Unit Bool)
                                        }
                                        (lam thunk Unit [ [ fEqData_c b ] b ])
                                      ]
                                      (lam thunk Unit False)
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            ]
                          )
                        )
                      ]
                    )
                  )
                )
                (let
                  (nonrec)
                  (datatypebind
                    (datatype
                      (tyvardecl GameState (type))

                      GameState_match
                      (vardecl
                        Initialised
                        (fun (con bytestring) (fun (con bytestring) (fun (con bytestring) GameState)))
                      )
                      (vardecl
                        Locked
                        (fun (con bytestring) (fun (con bytestring) (fun (con bytestring) GameState)))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl Maybe (fun (type) (type)))
                      (tyvardecl a (type))
                      Maybe_match
                      (vardecl Just (fun a [Maybe a]))
                      (vardecl Nothing [Maybe a])
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl
                      fIsDataGameState_cfromData (fun Data [Maybe GameState])
                    )
                    (lam
                      ds
                      Data
                      [
                        [
                          [
                            [
                              [
                                [
                                  {
                                    [ Data_match ds ]
                                    (fun Unit [Maybe GameState])
                                  }
                                  (lam
                                    default_arg0
                                    (con bytestring)
                                    (lam thunk Unit { Nothing GameState })
                                  )
                                ]
                                (lam
                                  i
                                  (con integer)
                                  (lam
                                    ds
                                    [List Data]
                                    (lam
                                      thunk
                                      Unit
                                      [
                                        [
                                          [
                                            {
                                              [ { Nil_match Data } ds ]
                                              (fun Unit [Maybe GameState])
                                            }
                                            (lam
                                              thunk Unit { Nothing GameState }
                                            )
                                          ]
                                          (lam
                                            arg
                                            Data
                                            (lam
                                              ds
                                              [List Data]
                                              (lam
                                                thunk
                                                Unit
                                                [
                                                  [
                                                    [
                                                      {
                                                        [
                                                          { Nil_match Data } ds
                                                        ]
                                                        (fun Unit [Maybe GameState])
                                                      }
                                                      (lam
                                                        thunk
                                                        Unit
                                                        { Nothing GameState }
                                                      )
                                                    ]
                                                    (lam
                                                      arg
                                                      Data
                                                      (lam
                                                        ds
                                                        [List Data]
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  [
                                                                    {
                                                                      Nil_match
                                                                      Data
                                                                    }
                                                                    ds
                                                                  ]
                                                                  (fun Unit [Maybe GameState])
                                                                }
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  {
                                                                    Nothing
                                                                    GameState
                                                                  }
                                                                )
                                                              ]
                                                              (lam
                                                                arg
                                                                Data
                                                                (lam
                                                                  ds
                                                                  [List Data]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                Nil_match
                                                                                Data
                                                                              }
                                                                              ds
                                                                            ]
                                                                            (fun Unit [Maybe GameState])
                                                                          }
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      Bool_match
                                                                                      [
                                                                                        [
                                                                                          equalsInteger
                                                                                          i
                                                                                        ]
                                                                                        (con
                                                                                          integer
                                                                                            0
                                                                                        )
                                                                                      ]
                                                                                    ]
                                                                                    (fun Unit [Maybe GameState])
                                                                                  }
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  [
                                                                                                    Data_match
                                                                                                    arg
                                                                                                  ]
                                                                                                  (fun Unit [Maybe GameState])
                                                                                                }
                                                                                                (lam
                                                                                                  b
                                                                                                  (con bytestring)
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    [
                                                                                                      [
                                                                                                        [
                                                                                                          [
                                                                                                            [
                                                                                                              [
                                                                                                                {
                                                                                                                  [
                                                                                                                    Data_match
                                                                                                                    arg
                                                                                                                  ]
                                                                                                                  (fun Unit [Maybe GameState])
                                                                                                                }
                                                                                                                (lam
                                                                                                                  b
                                                                                                                  (con bytestring)
                                                                                                                  (lam
                                                                                                                    thunk
                                                                                                                    Unit
                                                                                                                    [
                                                                                                                      [
                                                                                                                        [
                                                                                                                          [
                                                                                                                            [
                                                                                                                              [
                                                                                                                                {
                                                                                                                                  [
                                                                                                                                    Data_match
                                                                                                                                    arg
                                                                                                                                  ]
                                                                                                                                  (fun Unit [Maybe GameState])
                                                                                                                                }
                                                                                                                                (lam
                                                                                                                                  b
                                                                                                                                  (con bytestring)
                                                                                                                                  (lam
                                                                                                                                    thunk
                                                                                                                                    Unit
                                                                                                                                    [
                                                                                                                                      {
                                                                                                                                        Just
                                                                                                                                        GameState
                                                                                                                                      }
                                                                                                                                      [
                                                                                                                                        [
                                                                                                                                          [
                                                                                                                                            Initialised
                                                                                                                                            b
                                                                                                                                          ]
                                                                                                                                          b
                                                                                                                                        ]
                                                                                                                                        b
                                                                                                                                      ]
                                                                                                                                    ]
                                                                                                                                  )
                                                                                                                                )
                                                                                                                              ]
                                                                                                                              (lam
                                                                                                                                default_arg0
                                                                                                                                (con integer)
                                                                                                                                (lam
                                                                                                                                  default_arg1
                                                                                                                                  [List Data]
                                                                                                                                  (lam
                                                                                                                                    thunk
                                                                                                                                    Unit
                                                                                                                                    {
                                                                                                                                      Nothing
                                                                                                                                      GameState
                                                                                                                                    }
                                                                                                                                  )
                                                                                                                                )
                                                                                                                              )
                                                                                                                            ]
                                                                                                                            (lam
                                                                                                                              default_arg0
                                                                                                                              (con integer)
                                                                                                                              (lam
                                                                                                                                thunk
                                                                                                                                Unit
                                                                                                                                {
                                                                                                                                  Nothing
                                                                                                                                  GameState
                                                                                                                                }
                                                                                                                              )
                                                                                                                            )
                                                                                                                          ]
                                                                                                                          (lam
                                                                                                                            default_arg0
                                                                                                                            [List Data]
                                                                                                                            (lam
                                                                                                                              thunk
                                                                                                                              Unit
                                                                                                                              {
                                                                                                                                Nothing
                                                                                                                                GameState
                                                                                                                              }
                                                                                                                            )
                                                                                                                          )
                                                                                                                        ]
                                                                                                                        (lam
                                                                                                                          default_arg0
                                                                                                                          [List [[Tuple2 Data] Data]]
                                                                                                                          (lam
                                                                                                                            thunk
                                                                                                                            Unit
                                                                                                                            {
                                                                                                                              Nothing
                                                                                                                              GameState
                                                                                                                            }
                                                                                                                          )
                                                                                                                        )
                                                                                                                      ]
                                                                                                                      Unit
                                                                                                                    ]
                                                                                                                  )
                                                                                                                )
                                                                                                              ]
                                                                                                              (lam
                                                                                                                default_arg0
                                                                                                                (con integer)
                                                                                                                (lam
                                                                                                                  default_arg1
                                                                                                                  [List Data]
                                                                                                                  (lam
                                                                                                                    thunk
                                                                                                                    Unit
                                                                                                                    {
                                                                                                                      Nothing
                                                                                                                      GameState
                                                                                                                    }
                                                                                                                  )
                                                                                                                )
                                                                                                              )
                                                                                                            ]
                                                                                                            (lam
                                                                                                              default_arg0
                                                                                                              (con integer)
                                                                                                              (lam
                                                                                                                thunk
                                                                                                                Unit
                                                                                                                {
                                                                                                                  Nothing
                                                                                                                  GameState
                                                                                                                }
                                                                                                              )
                                                                                                            )
                                                                                                          ]
                                                                                                          (lam
                                                                                                            default_arg0
                                                                                                            [List Data]
                                                                                                            (lam
                                                                                                              thunk
                                                                                                              Unit
                                                                                                              {
                                                                                                                Nothing
                                                                                                                GameState
                                                                                                              }
                                                                                                            )
                                                                                                          )
                                                                                                        ]
                                                                                                        (lam
                                                                                                          default_arg0
                                                                                                          [List [[Tuple2 Data] Data]]
                                                                                                          (lam
                                                                                                            thunk
                                                                                                            Unit
                                                                                                            {
                                                                                                              Nothing
                                                                                                              GameState
                                                                                                            }
                                                                                                          )
                                                                                                        )
                                                                                                      ]
                                                                                                      Unit
                                                                                                    ]
                                                                                                  )
                                                                                                )
                                                                                              ]
                                                                                              (lam
                                                                                                default_arg0
                                                                                                (con integer)
                                                                                                (lam
                                                                                                  default_arg1
                                                                                                  [List Data]
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    {
                                                                                                      Nothing
                                                                                                      GameState
                                                                                                    }
                                                                                                  )
                                                                                                )
                                                                                              )
                                                                                            ]
                                                                                            (lam
                                                                                              default_arg0
                                                                                              (con integer)
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                {
                                                                                                  Nothing
                                                                                                  GameState
                                                                                                }
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            default_arg0
                                                                                            [List Data]
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              {
                                                                                                Nothing
                                                                                                GameState
                                                                                              }
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          default_arg0
                                                                                          [List [[Tuple2 Data] Data]]
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            {
                                                                                              Nothing
                                                                                              GameState
                                                                                            }
                                                                                          )
                                                                                        )
                                                                                      ]
                                                                                      Unit
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  [
                                                                                    [
                                                                                      [
                                                                                        {
                                                                                          [
                                                                                            Bool_match
                                                                                            [
                                                                                              [
                                                                                                equalsInteger
                                                                                                i
                                                                                              ]
                                                                                              (con
                                                                                                integer
                                                                                                  1
                                                                                              )
                                                                                            ]
                                                                                          ]
                                                                                          (fun Unit [Maybe GameState])
                                                                                        }
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            [
                                                                                              [
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      {
                                                                                                        [
                                                                                                          Data_match
                                                                                                          arg
                                                                                                        ]
                                                                                                        (fun Unit [Maybe GameState])
                                                                                                      }
                                                                                                      (lam
                                                                                                        b
                                                                                                        (con bytestring)
                                                                                                        (lam
                                                                                                          thunk
                                                                                                          Unit
                                                                                                          [
                                                                                                            [
                                                                                                              [
                                                                                                                [
                                                                                                                  [
                                                                                                                    [
                                                                                                                      {
                                                                                                                        [
                                                                                                                          Data_match
                                                                                                                          arg
                                                                                                                        ]
                                                                                                                        (fun Unit [Maybe GameState])
                                                                                                                      }
                                                                                                                      (lam
                                                                                                                        b
                                                                                                                        (con bytestring)
                                                                                                                        (lam
                                                                                                                          thunk
                                                                                                                          Unit
                                                                                                                          [
                                                                                                                            [
                                                                                                                              [
                                                                                                                                [
                                                                                                                                  [
                                                                                                                                    [
                                                                                                                                      {
                                                                                                                                        [
                                                                                                                                          Data_match
                                                                                                                                          arg
                                                                                                                                        ]
                                                                                                                                        (fun Unit [Maybe GameState])
                                                                                                                                      }
                                                                                                                                      (lam
                                                                                                                                        b
                                                                                                                                        (con bytestring)
                                                                                                                                        (lam
                                                                                                                                          thunk
                                                                                                                                          Unit
                                                                                                                                          [
                                                                                                                                            {
                                                                                                                                              Just
                                                                                                                                              GameState
                                                                                                                                            }
                                                                                                                                            [
                                                                                                                                              [
                                                                                                                                                [
                                                                                                                                                  Locked
                                                                                                                                                  b
                                                                                                                                                ]
                                                                                                                                                b
                                                                                                                                              ]
                                                                                                                                              b
                                                                                                                                            ]
                                                                                                                                          ]
                                                                                                                                        )
                                                                                                                                      )
                                                                                                                                    ]
                                                                                                                                    (lam
                                                                                                                                      default_arg0
                                                                                                                                      (con integer)
                                                                                                                                      (lam
                                                                                                                                        default_arg1
                                                                                                                                        [List Data]
                                                                                                                                        (lam
                                                                                                                                          thunk
                                                                                                                                          Unit
                                                                                                                                          {
                                                                                                                                            Nothing
                                                                                                                                            GameState
                                                                                                                                          }
                                                                                                                                        )
                                                                                                                                      )
                                                                                                                                    )
                                                                                                                                  ]
                                                                                                                                  (lam
                                                                                                                                    default_arg0
                                                                                                                                    (con integer)
                                                                                                                                    (lam
                                                                                                                                      thunk
                                                                                                                                      Unit
                                                                                                                                      {
                                                                                                                                        Nothing
                                                                                                                                        GameState
                                                                                                                                      }
                                                                                                                                    )
                                                                                                                                  )
                                                                                                                                ]
                                                                                                                                (lam
                                                                                                                                  default_arg0
                                                                                                                                  [List Data]
                                                                                                                                  (lam
                                                                                                                                    thunk
                                                                                                                                    Unit
                                                                                                                                    {
                                                                                                                                      Nothing
                                                                                                                                      GameState
                                                                                                                                    }
                                                                                                                                  )
                                                                                                                                )
                                                                                                                              ]
                                                                                                                              (lam
                                                                                                                                default_arg0
                                                                                                                                [List [[Tuple2 Data] Data]]
                                                                                                                                (lam
                                                                                                                                  thunk
                                                                                                                                  Unit
                                                                                                                                  {
                                                                                                                                    Nothing
                                                                                                                                    GameState
                                                                                                                                  }
                                                                                                                                )
                                                                                                                              )
                                                                                                                            ]
                                                                                                                            Unit
                                                                                                                          ]
                                                                                                                        )
                                                                                                                      )
                                                                                                                    ]
                                                                                                                    (lam
                                                                                                                      default_arg0
                                                                                                                      (con integer)
                                                                                                                      (lam
                                                                                                                        default_arg1
                                                                                                                        [List Data]
                                                                                                                        (lam
                                                                                                                          thunk
                                                                                                                          Unit
                                                                                                                          {
                                                                                                                            Nothing
                                                                                                                            GameState
                                                                                                                          }
                                                                                                                        )
                                                                                                                      )
                                                                                                                    )
                                                                                                                  ]
                                                                                                                  (lam
                                                                                                                    default_arg0
                                                                                                                    (con integer)
                                                                                                                    (lam
                                                                                                                      thunk
                                                                                                                      Unit
                                                                                                                      {
                                                                                                                        Nothing
                                                                                                                        GameState
                                                                                                                      }
                                                                                                                    )
                                                                                                                  )
                                                                                                                ]
                                                                                                                (lam
                                                                                                                  default_arg0
                                                                                                                  [List Data]
                                                                                                                  (lam
                                                                                                                    thunk
                                                                                                                    Unit
                                                                                                                    {
                                                                                                                      Nothing
                                                                                                                      GameState
                                                                                                                    }
                                                                                                                  )
                                                                                                                )
                                                                                                              ]
                                                                                                              (lam
                                                                                                                default_arg0
                                                                                                                [List [[Tuple2 Data] Data]]
                                                                                                                (lam
                                                                                                                  thunk
                                                                                                                  Unit
                                                                                                                  {
                                                                                                                    Nothing
                                                                                                                    GameState
                                                                                                                  }
                                                                                                                )
                                                                                                              )
                                                                                                            ]
                                                                                                            Unit
                                                                                                          ]
                                                                                                        )
                                                                                                      )
                                                                                                    ]
                                                                                                    (lam
                                                                                                      default_arg0
                                                                                                      (con integer)
                                                                                                      (lam
                                                                                                        default_arg1
                                                                                                        [List Data]
                                                                                                        (lam
                                                                                                          thunk
                                                                                                          Unit
                                                                                                          {
                                                                                                            Nothing
                                                                                                            GameState
                                                                                                          }
                                                                                                        )
                                                                                                      )
                                                                                                    )
                                                                                                  ]
                                                                                                  (lam
                                                                                                    default_arg0
                                                                                                    (con integer)
                                                                                                    (lam
                                                                                                      thunk
                                                                                                      Unit
                                                                                                      {
                                                                                                        Nothing
                                                                                                        GameState
                                                                                                      }
                                                                                                    )
                                                                                                  )
                                                                                                ]
                                                                                                (lam
                                                                                                  default_arg0
                                                                                                  [List Data]
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    {
                                                                                                      Nothing
                                                                                                      GameState
                                                                                                    }
                                                                                                  )
                                                                                                )
                                                                                              ]
                                                                                              (lam
                                                                                                default_arg0
                                                                                                [List [[Tuple2 Data] Data]]
                                                                                                (lam
                                                                                                  thunk
                                                                                                  Unit
                                                                                                  {
                                                                                                    Nothing
                                                                                                    GameState
                                                                                                  }
                                                                                                )
                                                                                              )
                                                                                            ]
                                                                                            Unit
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        {
                                                                                          Nothing
                                                                                          GameState
                                                                                        }
                                                                                      )
                                                                                    ]
                                                                                    Unit
                                                                                  ]
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        ]
                                                                        (lam
                                                                          ipv
                                                                          Data
                                                                          (lam
                                                                            ipv
                                                                            [List Data]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              {
                                                                                Nothing
                                                                                GameState
                                                                              }
                                                                            )
                                                                          )
                                                                        )
                                                                      ]
                                                                      Unit
                                                                    ]
                                                                  )
                                                                )
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      )
                                                    )
                                                  ]
                                                  Unit
                                                ]
                                              )
                                            )
                                          )
                                        ]
                                        Unit
                                      ]
                                    )
                                  )
                                )
                              ]
                              (lam
                                default_arg0
                                (con integer)
                                (lam thunk Unit { Nothing GameState })
                              )
                            ]
                            (lam
                              default_arg0
                              [List Data]
                              (lam thunk Unit { Nothing GameState })
                            )
                          ]
                          (lam
                            default_arg0
                            [List [[Tuple2 Data] Data]]
                            (lam thunk Unit { Nothing GameState })
                          )
                        ]
                        Unit
                      ]
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl
                      build
                      (all a (type) (fun (all b (type) (fun (fun a (fun b b)) (fun b b))) [List a]))
                    )
                    (abs
                      a
                      (type)
                      (lam
                        g
                        (all b (type) (fun (fun a (fun b b)) (fun b b)))
                        [ [ { g [List a] } { Cons a } ] { Nil a } ]
                      )
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl fIsDataGameState_ctoData (fun GameState Data))
                    (lam
                      ds
                      GameState
                      [
                        [
                          { [ GameState_match ds ] Data }
                          (lam
                            arg
                            (con bytestring)
                            (lam
                              arg
                              (con bytestring)
                              (lam
                                arg
                                (con bytestring)
                                [
                                  [ Constr (con integer 0) ]
                                  [
                                    { build Data }
                                    (abs
                                      a
                                      (type)
                                      (lam
                                        c
                                        (fun Data (fun a a))
                                        (lam
                                          n
                                          a
                                          [
                                            [ c [ B arg ] ]
                                            [
                                              [ c [ B arg ] ]
                                              [ [ c [ B arg ] ] n ]
                                            ]
                                          ]
                                        )
                                      )
                                    )
                                  ]
                                ]
                              )
                            )
                          )
                        ]
                        (lam
                          arg
                          (con bytestring)
                          (lam
                            arg
                            (con bytestring)
                            (lam
                              arg
                              (con bytestring)
                              [
                                [ Constr (con integer 1) ]
                                [
                                  { build Data }
                                  (abs
                                    a
                                    (type)
                                    (lam
                                      c
                                      (fun Data (fun a a))
                                      (lam
                                        n
                                        a
                                        [
                                          [ c [ B arg ] ]
                                          [
                                            [ c [ B arg ] ]
                                            [ [ c [ B arg ] ] n ]
                                          ]
                                        ]
                                      )
                                    )
                                  )
                                ]
                              ]
                            )
                          )
                        )
                      ]
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl IsData (fun (type) (type)))
                      (tyvardecl a (type))
                      IsData_match
                      (vardecl
                        CConsIsData
                        (fun (fun a Data) (fun (fun Data [Maybe a]) [IsData a]))
                      )
                    )
                  )
                  (termbind
                    (nonstrict)
                    (vardecl fIsDataGameState [IsData GameState])
                    [
                      [ { CConsIsData GameState } fIsDataGameState_ctoData ]
                      fIsDataGameState_cfromData
                    ]
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl StakingCredential (type))

                      StakingCredential_match
                      (vardecl
                        StakingHash (fun (con bytestring) StakingCredential)
                      )
                      (vardecl
                        StakingPtr
                        (fun (con integer) (fun (con integer) (fun (con integer) StakingCredential)))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl DCert (type))

                      DCert_match
                      (vardecl DCertDelegDeRegKey (fun StakingCredential DCert))
                      (vardecl
                        DCertDelegDelegate
                        (fun StakingCredential (fun (con bytestring) DCert))
                      )
                      (vardecl DCertDelegRegKey (fun StakingCredential DCert))
                      (vardecl DCertGenesis DCert)
                      (vardecl DCertMir DCert)
                      (vardecl
                        DCertPoolRegister
                        (fun (con bytestring) (fun (con bytestring) DCert))
                      )
                      (vardecl
                        DCertPoolRetire
                        (fun (con bytestring) (fun (con integer) DCert))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl TxOutRef (type))

                      TxOutRef_match
                      (vardecl
                        TxOutRef
                        (fun (con bytestring) (fun (con integer) TxOutRef))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl ScriptPurpose (type))

                      ScriptPurpose_match
                      (vardecl Certifying (fun DCert ScriptPurpose))
                      (vardecl Minting (fun (con bytestring) ScriptPurpose))
                      (vardecl Rewarding (fun StakingCredential ScriptPurpose))
                      (vardecl Spending (fun TxOutRef ScriptPurpose))
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl Extended (fun (type) (type)))
                      (tyvardecl a (type))
                      Extended_match
                      (vardecl Finite (fun a [Extended a]))
                      (vardecl NegInf [Extended a])
                      (vardecl PosInf [Extended a])
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl LowerBound (fun (type) (type)))
                      (tyvardecl a (type))
                      LowerBound_match
                      (vardecl
                        LowerBound (fun [Extended a] (fun Bool [LowerBound a]))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl UpperBound (fun (type) (type)))
                      (tyvardecl a (type))
                      UpperBound_match
                      (vardecl
                        UpperBound (fun [Extended a] (fun Bool [UpperBound a]))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl Interval (fun (type) (type)))
                      (tyvardecl a (type))
                      Interval_match
                      (vardecl
                        Interval
                        (fun [LowerBound a] (fun [UpperBound a] [Interval a]))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl Credential (type))

                      Credential_match
                      (vardecl
                        PubKeyCredential (fun (con bytestring) Credential)
                      )
                      (vardecl
                        ScriptCredential (fun (con bytestring) Credential)
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl Address (type))

                      Address_match
                      (vardecl
                        Address
                        (fun Credential (fun [Maybe StakingCredential] Address))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl TxOut (type))

                      TxOut_match
                      (vardecl
                        TxOut
                        (fun Address (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [Maybe (con bytestring)] TxOut)))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl TxInInfo (type))

                      TxInInfo_match
                      (vardecl TxInInfo (fun TxOutRef (fun TxOut TxInInfo)))
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl TxInfo (type))

                      TxInfo_match
                      (vardecl
                        TxInfo
                        (fun [List TxInInfo] (fun [List TxInInfo] (fun [List TxOut] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [List DCert] (fun [List [[Tuple2 StakingCredential] (con integer)]] (fun [Interval (con integer)] (fun [List (con bytestring)] (fun [List [[Tuple2 (con bytestring)] Data]] (fun (con bytestring) TxInfo)))))))))))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl ScriptContext (type))

                      ScriptContext_match
                      (vardecl
                        ScriptContext
                        (fun TxInfo (fun ScriptPurpose ScriptContext))
                      )
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl
                      mkStateMachine
                      (all s (type) (all i (type) (fun s (fun i (fun ScriptContext Bool)))))
                    )
                    (abs
                      s
                      (type)
                      (abs
                        i
                        (type)
                        (lam ds s (lam ds i (lam ds ScriptContext True)))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl State (fun (type) (type)))
                      (tyvardecl s (type))
                      State_match
                      (vardecl
                        State
                        (fun s (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [State s]))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl InputConstraint (fun (type) (type)))
                      (tyvardecl a (type))
                      InputConstraint_match
                      (vardecl
                        InputConstraint
                        (fun a (fun TxOutRef [InputConstraint a]))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl OutputConstraint (fun (type) (type)))
                      (tyvardecl a (type))
                      OutputConstraint_match
                      (vardecl
                        OutputConstraint
                        (fun a (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [OutputConstraint a]))
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl TxConstraint (type))

                      TxConstraint_match
                      (vardecl
                        MustBeSignedBy (fun (con bytestring) TxConstraint)
                      )
                      (vardecl
                        MustForgeValue
                        (fun (con bytestring) (fun (con bytestring) (fun (con integer) TxConstraint)))
                      )
                      (vardecl
                        MustHashDatum
                        (fun (con bytestring) (fun Data TxConstraint))
                      )
                      (vardecl MustIncludeDatum (fun Data TxConstraint))
                      (vardecl
                        MustPayToOtherScript
                        (fun (con bytestring) (fun Data (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] TxConstraint)))
                      )
                      (vardecl
                        MustPayToPubKey
                        (fun (con bytestring) (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] TxConstraint))
                      )
                      (vardecl
                        MustProduceAtLeast
                        (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] TxConstraint)
                      )
                      (vardecl
                        MustSpendAtLeast
                        (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] TxConstraint)
                      )
                      (vardecl MustSpendPubKeyOutput (fun TxOutRef TxConstraint)
                      )
                      (vardecl
                        MustSpendScriptOutput
                        (fun TxOutRef (fun Data TxConstraint))
                      )
                      (vardecl
                        MustValidateIn
                        (fun [Interval (con integer)] TxConstraint)
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl TxConstraints (fun (type) (fun (type) (type))))
                      (tyvardecl i (type)) (tyvardecl o (type))
                      TxConstraints_match
                      (vardecl
                        TxConstraints
                        (fun [List TxConstraint] (fun [List [InputConstraint i]] (fun [List [OutputConstraint o]] [[TxConstraints i] o])))
                      )
                    )
                  )
                  (datatypebind (datatype (tyvardecl Void (type))  Void_match ))
                  (datatypebind
                    (datatype
                      (tyvardecl StateMachine (fun (type) (fun (type) (type))))
                      (tyvardecl s (type)) (tyvardecl i (type))
                      StateMachine_match
                      (vardecl
                        StateMachine
                        (fun (fun [State s] (fun i [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State s]]])) (fun (fun s Bool) (fun (fun s (fun i (fun ScriptContext Bool))) [[StateMachine s] i])))
                      )
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl
                      fAdditiveGroupValue_cscale
                      (fun (con integer) (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]))
                    )
                    (lam
                      i
                      (con integer)
                      (lam
                        ds
                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                        (let
                          (rec)
                          (termbind
                            (strict)
                            (vardecl
                              go
                              (fun [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]] [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]])
                            )
                            (lam
                              ds
                              [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                              [
                                [
                                  [
                                    {
                                      [
                                        {
                                          Nil_match
                                          [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                        }
                                        ds
                                      ]
                                      (fun Unit [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]])
                                    }
                                    (lam
                                      thunk
                                      Unit
                                      {
                                        Nil
                                        [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                      }
                                    )
                                  ]
                                  (lam
                                    ds
                                    [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                    (lam
                                      xs
                                      [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                      (lam
                                        thunk
                                        Unit
                                        [
                                          {
                                            [
                                              {
                                                {
                                                  Tuple2_match (con bytestring)
                                                }
                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                              }
                                              ds
                                            ]
                                            [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                          }
                                          (lam
                                            c
                                            (con bytestring)
                                            (lam
                                              i
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                              (let
                                                (rec)
                                                (termbind
                                                  (strict)
                                                  (vardecl
                                                    go
                                                    (fun [List [[Tuple2 (con bytestring)] (con integer)]] [List [[Tuple2 (con bytestring)] (con integer)]])
                                                  )
                                                  (lam
                                                    ds
                                                    [List [[Tuple2 (con bytestring)] (con integer)]]
                                                    [
                                                      [
                                                        [
                                                          {
                                                            [
                                                              {
                                                                Nil_match
                                                                [[Tuple2 (con bytestring)] (con integer)]
                                                              }
                                                              ds
                                                            ]
                                                            (fun Unit [List [[Tuple2 (con bytestring)] (con integer)]])
                                                          }
                                                          (lam
                                                            thunk
                                                            Unit
                                                            {
                                                              Nil
                                                              [[Tuple2 (con bytestring)] (con integer)]
                                                            }
                                                          )
                                                        ]
                                                        (lam
                                                          ds
                                                          [[Tuple2 (con bytestring)] (con integer)]
                                                          (lam
                                                            xs
                                                            [List [[Tuple2 (con bytestring)] (con integer)]]
                                                            (lam
                                                              thunk
                                                              Unit
                                                              [
                                                                {
                                                                  [
                                                                    {
                                                                      {
                                                                        Tuple2_match
                                                                        (con bytestring)
                                                                      }
                                                                      (con integer)
                                                                    }
                                                                    ds
                                                                  ]
                                                                  [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                }
                                                                (lam
                                                                  c
                                                                  (con bytestring)
                                                                  (lam
                                                                    i
                                                                    (con integer)
                                                                    [
                                                                      [
                                                                        {
                                                                          Cons
                                                                          [[Tuple2 (con bytestring)] (con integer)]
                                                                        }
                                                                        [
                                                                          [
                                                                            {
                                                                              {
                                                                                Tuple2
                                                                                (con bytestring)
                                                                              }
                                                                              (con integer)
                                                                            }
                                                                            c
                                                                          ]
                                                                          [
                                                                            [
                                                                              (builtin
                                                                                multiplyInteger
                                                                              )
                                                                              i
                                                                            ]
                                                                            i
                                                                          ]
                                                                        ]
                                                                      ]
                                                                      [ go xs ]
                                                                    ]
                                                                  )
                                                                )
                                                              ]
                                                            )
                                                          )
                                                        )
                                                      ]
                                                      Unit
                                                    ]
                                                  )
                                                )
                                                [
                                                  [
                                                    {
                                                      Cons
                                                      [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                    }
                                                    [
                                                      [
                                                        {
                                                          {
                                                            Tuple2
                                                            (con bytestring)
                                                          }
                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                        }
                                                        c
                                                      ]
                                                      [ go i ]
                                                    ]
                                                  ]
                                                  [ go xs ]
                                                ]
                                              )
                                            )
                                          )
                                        ]
                                      )
                                    )
                                  )
                                ]
                                Unit
                              ]
                            )
                          )
                          [ go ds ]
                        )
                      )
                    )
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl AdditiveMonoid (fun (type) (type)))
                      (tyvardecl a (type))
                      AdditiveMonoid_match
                      (vardecl
                        CConsAdditiveMonoid
                        (fun [(lam a (type) (fun a (fun a a))) a] (fun a [AdditiveMonoid a]))
                      )
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl bad_name (fun Bool (fun Bool Bool)))
                    (lam
                      ds
                      Bool
                      (lam
                        ds
                        Bool
                        [
                          [
                            [
                              { [ Bool_match ds ] (fun Unit Bool) }
                              (lam thunk Unit True)
                            ]
                            (lam thunk Unit ds)
                          ]
                          Unit
                        ]
                      )
                    )
                  )
                  (termbind
                    (nonstrict)
                    (vardecl fAdditiveMonoidBool [AdditiveMonoid Bool])
                    [ [ { CConsAdditiveMonoid Bool } bad_name ] False ]
                  )
                  (datatypebind
                    (datatype
                      (tyvardecl Monoid (fun (type) (type)))
                      (tyvardecl a (type))
                      Monoid_match
                      (vardecl
                        CConsMonoid
                        (fun [(lam a (type) (fun a (fun a a))) a] (fun a [Monoid a]))
                      )
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl
                      p1Monoid
                      (all a (type) (fun [Monoid a] [(lam a (type) (fun a (fun a a))) a]))
                    )
                    (abs
                      a
                      (type)
                      (lam
                        v
                        [Monoid a]
                        [
                          {
                            [ { Monoid_match a } v ]
                            [(lam a (type) (fun a (fun a a))) a]
                          }
                          (lam
                            v [(lam a (type) (fun a (fun a a))) a] (lam v a v)
                          )
                        ]
                      )
                    )
                  )
                  (termbind
                    (strict)
                    (vardecl mempty (all a (type) (fun [Monoid a] a)))
                    (abs
                      a
                      (type)
                      (lam
                        v
                        [Monoid a]
                        [
                          { [ { Monoid_match a } v ] a }
                          (lam
                            v [(lam a (type) (fun a (fun a a))) a] (lam v a v)
                          )
                        ]
                      )
                    )
                  )
                  (let
                    (rec)
                    (termbind
                      (nonstrict)
                      (vardecl
                        fFoldableNil_cfoldMap
                        (all m (type) (all a (type) (fun [Monoid m] (fun (fun a m) (fun [List a] m)))))
                      )
                      (abs
                        m
                        (type)
                        (abs
                          a
                          (type)
                          (lam
                            dMonoid
                            [Monoid m]
                            (let
                              (nonrec)
                              (termbind
                                (nonstrict)
                                (vardecl
                                  dSemigroup
                                  [(lam a (type) (fun a (fun a a))) m]
                                )
                                [ { p1Monoid m } dMonoid ]
                              )
                              (lam
                                ds
                                (fun a m)
                                (lam
                                  ds
                                  [List a]
                                  [
                                    [
                                      [
                                        { [ { Nil_match a } ds ] (fun Unit m) }
                                        (lam thunk Unit [ { mempty m } dMonoid ]
                                        )
                                      ]
                                      (lam
                                        x
                                        a
                                        (lam
                                          xs
                                          [List a]
                                          (lam
                                            thunk
                                            Unit
                                            [
                                              [ dSemigroup [ ds x ] ]
                                              [
                                                [
                                                  [
                                                    {
                                                      {
                                                        fFoldableNil_cfoldMap m
                                                      }
                                                      a
                                                    }
                                                    dMonoid
                                                  ]
                                                  ds
                                                ]
                                                xs
                                              ]
                                            ]
                                          )
                                        )
                                      )
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                    (let
                      (rec)
                      (termbind
                        (nonstrict)
                        (vardecl
                          fFunctorNil_cfmap
                          (all a (type) (all b (type) (fun (fun a b) (fun [List a] [List b]))))
                        )
                        (abs
                          a
                          (type)
                          (abs
                            b
                            (type)
                            (lam
                              f
                              (fun a b)
                              (lam
                                l
                                [List a]
                                [
                                  [
                                    [
                                      {
                                        [ { Nil_match a } l ]
                                        (fun Unit [List b])
                                      }
                                      (lam thunk Unit { Nil b })
                                    ]
                                    (lam
                                      x
                                      a
                                      (lam
                                        xs
                                        [List a]
                                        (lam
                                          thunk
                                          Unit
                                          [
                                            [ { Cons b } [ f x ] ]
                                            [
                                              [
                                                { { fFunctorNil_cfmap a } b } f
                                              ]
                                              xs
                                            ]
                                          ]
                                        )
                                      )
                                    )
                                  ]
                                  Unit
                                ]
                              )
                            )
                          )
                        )
                      )
                      (let
                        (nonrec)
                        (termbind
                          (strict)
                          (vardecl
                            p1AdditiveMonoid
                            (all a (type) (fun [AdditiveMonoid a] [(lam a (type) (fun a (fun a a))) a]))
                          )
                          (abs
                            a
                            (type)
                            (lam
                              v
                              [AdditiveMonoid a]
                              [
                                {
                                  [ { AdditiveMonoid_match a } v ]
                                  [(lam a (type) (fun a (fun a a))) a]
                                }
                                (lam
                                  v
                                  [(lam a (type) (fun a (fun a a))) a]
                                  (lam v a v)
                                )
                              ]
                            )
                          )
                        )
                        (termbind
                          (strict)
                          (vardecl
                            zero (all a (type) (fun [AdditiveMonoid a] a))
                          )
                          (abs
                            a
                            (type)
                            (lam
                              v
                              [AdditiveMonoid a]
                              [
                                { [ { AdditiveMonoid_match a } v ] a }
                                (lam
                                  v
                                  [(lam a (type) (fun a (fun a a))) a]
                                  (lam v a v)
                                )
                              ]
                            )
                          )
                        )
                        (termbind
                          (strict)
                          (vardecl
                            fMonoidSum
                            (all a (type) (fun [AdditiveMonoid a] [Monoid [(lam a (type) a) a]]))
                          )
                          (abs
                            a
                            (type)
                            (lam
                              v
                              [AdditiveMonoid a]
                              [
                                [
                                  { CConsMonoid [(lam a (type) a) a] }
                                  (lam
                                    eta
                                    [(lam a (type) a) a]
                                    (lam
                                      eta
                                      [(lam a (type) a) a]
                                      [
                                        [ [ { p1AdditiveMonoid a } v ] eta ] eta
                                      ]
                                    )
                                  )
                                ]
                                [ { zero a } v ]
                              ]
                            )
                          )
                        )
                        (let
                          (rec)
                          (termbind
                            (nonstrict)
                            (vardecl
                              foldr
                              (all a (type) (all b (type) (fun (fun a (fun b b)) (fun b (fun [List a] b)))))
                            )
                            (abs
                              a
                              (type)
                              (abs
                                b
                                (type)
                                (lam
                                  f
                                  (fun a (fun b b))
                                  (lam
                                    acc
                                    b
                                    (lam
                                      l
                                      [List a]
                                      [
                                        [
                                          [
                                            {
                                              [ { Nil_match a } l ] (fun Unit b)
                                            }
                                            (lam thunk Unit acc)
                                          ]
                                          (lam
                                            x
                                            a
                                            (lam
                                              xs
                                              [List a]
                                              (lam
                                                thunk
                                                Unit
                                                [
                                                  [ f x ]
                                                  [
                                                    [
                                                      [ { { foldr a } b } f ]
                                                      acc
                                                    ]
                                                    xs
                                                  ]
                                                ]
                                              )
                                            )
                                          )
                                        ]
                                        Unit
                                      ]
                                    )
                                  )
                                )
                              )
                            )
                          )
                          (let
                            (nonrec)
                            (termbind
                              (strict)
                              (vardecl
                                union
                                (all k (type) (all v (type) (all r (type) (fun [(lam a (type) (fun a (fun a Bool))) k] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) k] v] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) k] r] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) k] [[These v] r]]))))))
                              )
                              (abs
                                k
                                (type)
                                (abs
                                  v
                                  (type)
                                  (abs
                                    r
                                    (type)
                                    (lam
                                      dEq
                                      [(lam a (type) (fun a (fun a Bool))) k]
                                      (lam
                                        ds
                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) k] v]
                                        (lam
                                          ds
                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) k] r]
                                          [
                                            [
                                              [
                                                {
                                                  {
                                                    foldr
                                                    [[Tuple2 k] [[These v] r]]
                                                  }
                                                  [List [[Tuple2 k] [[These v] r]]]
                                                }
                                                {
                                                  Cons
                                                  [[Tuple2 k] [[These v] r]]
                                                }
                                              ]
                                              [
                                                [
                                                  {
                                                    {
                                                      fFunctorNil_cfmap
                                                      [[Tuple2 k] r]
                                                    }
                                                    [[Tuple2 k] [[These v] r]]
                                                  }
                                                  (lam
                                                    ds
                                                    [[Tuple2 k] r]
                                                    [
                                                      {
                                                        [
                                                          {
                                                            { Tuple2_match k } r
                                                          }
                                                          ds
                                                        ]
                                                        [[Tuple2 k] [[These v] r]]
                                                      }
                                                      (lam
                                                        c
                                                        k
                                                        (lam
                                                          b
                                                          r
                                                          [
                                                            [
                                                              {
                                                                { Tuple2 k }
                                                                [[These v] r]
                                                              }
                                                              c
                                                            ]
                                                            [
                                                              { { That v } r } b
                                                            ]
                                                          ]
                                                        )
                                                      )
                                                    ]
                                                  )
                                                ]
                                                [
                                                  [
                                                    [
                                                      {
                                                        { foldr [[Tuple2 k] r] }
                                                        [List [[Tuple2 k] r]]
                                                      }
                                                      (lam
                                                        e
                                                        [[Tuple2 k] r]
                                                        (lam
                                                          xs
                                                          [List [[Tuple2 k] r]]
                                                          [
                                                            {
                                                              [
                                                                {
                                                                  {
                                                                    Tuple2_match
                                                                    k
                                                                  }
                                                                  r
                                                                }
                                                                e
                                                              ]
                                                              [List [[Tuple2 k] r]]
                                                            }
                                                            (lam
                                                              c
                                                              k
                                                              (lam
                                                                ds
                                                                r
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          Bool_match
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  {
                                                                                    fFoldableNil_cfoldMap
                                                                                    [(lam a (type) a) Bool]
                                                                                  }
                                                                                  [[Tuple2 k] v]
                                                                                }
                                                                                [
                                                                                  {
                                                                                    fMonoidSum
                                                                                    Bool
                                                                                  }
                                                                                  fAdditiveMonoidBool
                                                                                ]
                                                                              ]
                                                                              (lam
                                                                                ds
                                                                                [[Tuple2 k] v]
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      {
                                                                                        {
                                                                                          Tuple2_match
                                                                                          k
                                                                                        }
                                                                                        v
                                                                                      }
                                                                                      ds
                                                                                    ]
                                                                                    Bool
                                                                                  }
                                                                                  (lam
                                                                                    c
                                                                                    k
                                                                                    (lam
                                                                                      ds
                                                                                      v
                                                                                      [
                                                                                        [
                                                                                          dEq
                                                                                          c
                                                                                        ]
                                                                                        c
                                                                                      ]
                                                                                    )
                                                                                  )
                                                                                ]
                                                                              )
                                                                            ]
                                                                            ds
                                                                          ]
                                                                        ]
                                                                        (fun Unit [List [[Tuple2 k] r]])
                                                                      }
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        xs
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        [
                                                                          {
                                                                            Cons
                                                                            [[Tuple2 k] r]
                                                                          }
                                                                          e
                                                                        ]
                                                                        xs
                                                                      ]
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            )
                                                          ]
                                                        )
                                                      )
                                                    ]
                                                    { Nil [[Tuple2 k] r] }
                                                  ]
                                                  ds
                                                ]
                                              ]
                                            ]
                                            [
                                              [
                                                {
                                                  {
                                                    fFunctorNil_cfmap
                                                    [[Tuple2 k] v]
                                                  }
                                                  [[Tuple2 k] [[These v] r]]
                                                }
                                                (lam
                                                  ds
                                                  [[Tuple2 k] v]
                                                  [
                                                    {
                                                      [
                                                        { { Tuple2_match k } v }
                                                        ds
                                                      ]
                                                      [[Tuple2 k] [[These v] r]]
                                                    }
                                                    (lam
                                                      c
                                                      k
                                                      (lam
                                                        i
                                                        v
                                                        (let
                                                          (rec)
                                                          (termbind
                                                            (strict)
                                                            (vardecl
                                                              go
                                                              (fun [List [[Tuple2 k] r]] [[These v] r])
                                                            )
                                                            (lam
                                                              ds
                                                              [List [[Tuple2 k] r]]
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      [
                                                                        {
                                                                          Nil_match
                                                                          [[Tuple2 k] r]
                                                                        }
                                                                        ds
                                                                      ]
                                                                      (fun Unit [[These v] r])
                                                                    }
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        {
                                                                          {
                                                                            This
                                                                            v
                                                                          }
                                                                          r
                                                                        }
                                                                        i
                                                                      ]
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    ds
                                                                    [[Tuple2 k] r]
                                                                    (lam
                                                                      xs
                                                                      [List [[Tuple2 k] r]]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                {
                                                                                  Tuple2_match
                                                                                  k
                                                                                }
                                                                                r
                                                                              }
                                                                              ds
                                                                            ]
                                                                            [[These v] r]
                                                                          }
                                                                          (lam
                                                                            c
                                                                            k
                                                                            (lam
                                                                              i
                                                                              r
                                                                              [
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      [
                                                                                        Bool_match
                                                                                        [
                                                                                          [
                                                                                            dEq
                                                                                            c
                                                                                          ]
                                                                                          c
                                                                                        ]
                                                                                      ]
                                                                                      (fun Unit [[These v] r])
                                                                                    }
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      [
                                                                                        [
                                                                                          {
                                                                                            {
                                                                                              These
                                                                                              v
                                                                                            }
                                                                                            r
                                                                                          }
                                                                                          i
                                                                                        ]
                                                                                        i
                                                                                      ]
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      go
                                                                                      xs
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                Unit
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                      )
                                                                    )
                                                                  )
                                                                ]
                                                                Unit
                                                              ]
                                                            )
                                                          )
                                                          [
                                                            [
                                                              {
                                                                { Tuple2 k }
                                                                [[These v] r]
                                                              }
                                                              c
                                                            ]
                                                            [ go ds ]
                                                          ]
                                                        )
                                                      )
                                                    )
                                                  ]
                                                )
                                              ]
                                              ds
                                            ]
                                          ]
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                unionVal
                                (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]))
                              )
                              (lam
                                ds
                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                (lam
                                  ds
                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                  (let
                                    (rec)
                                    (termbind
                                      (strict)
                                      (vardecl
                                        go
                                        (fun [List [[Tuple2 (con bytestring)] [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]] [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]])
                                      )
                                      (lam
                                        ds
                                        [List [[Tuple2 (con bytestring)] [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]]
                                        [
                                          [
                                            [
                                              {
                                                [
                                                  {
                                                    Nil_match
                                                    [[Tuple2 (con bytestring)] [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                  }
                                                  ds
                                                ]
                                                (fun Unit [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]])
                                              }
                                              (lam
                                                thunk
                                                Unit
                                                {
                                                  Nil
                                                  [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]
                                                }
                                              )
                                            ]
                                            (lam
                                              ds
                                              [[Tuple2 (con bytestring)] [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                              (lam
                                                xs
                                                [List [[Tuple2 (con bytestring)] [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]]
                                                (lam
                                                  thunk
                                                  Unit
                                                  [
                                                    {
                                                      [
                                                        {
                                                          {
                                                            Tuple2_match
                                                            (con bytestring)
                                                          }
                                                          [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                        }
                                                        ds
                                                      ]
                                                      [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]]
                                                    }
                                                    (lam
                                                      c
                                                      (con bytestring)
                                                      (lam
                                                        i
                                                        [[These [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                        [
                                                          [
                                                            {
                                                              Cons
                                                              [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]
                                                            }
                                                            [
                                                              [
                                                                {
                                                                  {
                                                                    Tuple2
                                                                    (con bytestring)
                                                                  }
                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]
                                                                }
                                                                c
                                                              ]
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      [
                                                                        {
                                                                          {
                                                                            These_match
                                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                          }
                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                        }
                                                                        i
                                                                      ]
                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]
                                                                    }
                                                                    (lam
                                                                      b
                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                      (let
                                                                        (rec)
                                                                        (termbind
                                                                          (strict
                                                                          )
                                                                          (vardecl
                                                                            go
                                                                            (fun [List [[Tuple2 (con bytestring)] (con integer)]] [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]])
                                                                          )
                                                                          (lam
                                                                            ds
                                                                            [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      {
                                                                                        Nil_match
                                                                                        [[Tuple2 (con bytestring)] (con integer)]
                                                                                      }
                                                                                      ds
                                                                                    ]
                                                                                    (fun Unit [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]])
                                                                                  }
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    {
                                                                                      Nil
                                                                                      [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                                    }
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  ds
                                                                                  [[Tuple2 (con bytestring)] (con integer)]
                                                                                  (lam
                                                                                    xs
                                                                                    [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      [
                                                                                        {
                                                                                          [
                                                                                            {
                                                                                              {
                                                                                                Tuple2_match
                                                                                                (con bytestring)
                                                                                              }
                                                                                              (con integer)
                                                                                            }
                                                                                            ds
                                                                                          ]
                                                                                          [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]]
                                                                                        }
                                                                                        (lam
                                                                                          c
                                                                                          (con bytestring)
                                                                                          (lam
                                                                                            i
                                                                                            (con integer)
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  Cons
                                                                                                  [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                                                }
                                                                                                [
                                                                                                  [
                                                                                                    {
                                                                                                      {
                                                                                                        Tuple2
                                                                                                        (con bytestring)
                                                                                                      }
                                                                                                      [[These (con integer)] (con integer)]
                                                                                                    }
                                                                                                    c
                                                                                                  ]
                                                                                                  [
                                                                                                    {
                                                                                                      {
                                                                                                        That
                                                                                                        (con integer)
                                                                                                      }
                                                                                                      (con integer)
                                                                                                    }
                                                                                                    i
                                                                                                  ]
                                                                                                ]
                                                                                              ]
                                                                                              [
                                                                                                go
                                                                                                xs
                                                                                              ]
                                                                                            ]
                                                                                          )
                                                                                        )
                                                                                      ]
                                                                                    )
                                                                                  )
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        )
                                                                        [ go b ]
                                                                      )
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    a
                                                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                    (lam
                                                                      b
                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                      [
                                                                        [
                                                                          [
                                                                            {
                                                                              {
                                                                                {
                                                                                  union
                                                                                  (con bytestring)
                                                                                }
                                                                                (con integer)
                                                                              }
                                                                              (con integer)
                                                                            }
                                                                            equalsByteString
                                                                          ]
                                                                          a
                                                                        ]
                                                                        b
                                                                      ]
                                                                    )
                                                                  )
                                                                ]
                                                                (lam
                                                                  a
                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                  (let
                                                                    (rec)
                                                                    (termbind
                                                                      (strict)
                                                                      (vardecl
                                                                        go
                                                                        (fun [List [[Tuple2 (con bytestring)] (con integer)]] [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]])
                                                                      )
                                                                      (lam
                                                                        ds
                                                                        [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                        [
                                                                          [
                                                                            [
                                                                              {
                                                                                [
                                                                                  {
                                                                                    Nil_match
                                                                                    [[Tuple2 (con bytestring)] (con integer)]
                                                                                  }
                                                                                  ds
                                                                                ]
                                                                                (fun Unit [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]])
                                                                              }
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                {
                                                                                  Nil
                                                                                  [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                                }
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              ds
                                                                              [[Tuple2 (con bytestring)] (con integer)]
                                                                              (lam
                                                                                xs
                                                                                [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  [
                                                                                    {
                                                                                      [
                                                                                        {
                                                                                          {
                                                                                            Tuple2_match
                                                                                            (con bytestring)
                                                                                          }
                                                                                          (con integer)
                                                                                        }
                                                                                        ds
                                                                                      ]
                                                                                      [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]]
                                                                                    }
                                                                                    (lam
                                                                                      c
                                                                                      (con bytestring)
                                                                                      (lam
                                                                                        i
                                                                                        (con integer)
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              Cons
                                                                                              [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                                            }
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  {
                                                                                                    Tuple2
                                                                                                    (con bytestring)
                                                                                                  }
                                                                                                  [[These (con integer)] (con integer)]
                                                                                                }
                                                                                                c
                                                                                              ]
                                                                                              [
                                                                                                {
                                                                                                  {
                                                                                                    This
                                                                                                    (con integer)
                                                                                                  }
                                                                                                  (con integer)
                                                                                                }
                                                                                                i
                                                                                              ]
                                                                                            ]
                                                                                          ]
                                                                                          [
                                                                                            go
                                                                                            xs
                                                                                          ]
                                                                                        ]
                                                                                      )
                                                                                    )
                                                                                  ]
                                                                                )
                                                                              )
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    )
                                                                    [ go a ]
                                                                  )
                                                                )
                                                              ]
                                                            ]
                                                          ]
                                                          [ go xs ]
                                                        ]
                                                      )
                                                    )
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                          Unit
                                        ]
                                      )
                                    )
                                    [
                                      go
                                      [
                                        [
                                          [
                                            {
                                              {
                                                { union (con bytestring) }
                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                              }
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                            }
                                            equalsByteString
                                          ]
                                          ds
                                        ]
                                        ds
                                      ]
                                    ]
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                unionWith
                                (fun (fun (con integer) (fun (con integer) (con integer))) (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]])))
                              )
                              (lam
                                f
                                (fun (con integer) (fun (con integer) (con integer)))
                                (lam
                                  ls
                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                  (lam
                                    rs
                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                    (let
                                      (rec)
                                      (termbind
                                        (strict)
                                        (vardecl
                                          go
                                          (fun [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]] [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]])
                                        )
                                        (lam
                                          ds
                                          [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]]
                                          [
                                            [
                                              [
                                                {
                                                  [
                                                    {
                                                      Nil_match
                                                      [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]
                                                    }
                                                    ds
                                                  ]
                                                  (fun Unit [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]])
                                                }
                                                (lam
                                                  thunk
                                                  Unit
                                                  {
                                                    Nil
                                                    [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                  }
                                                )
                                              ]
                                              (lam
                                                ds
                                                [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]
                                                (lam
                                                  xs
                                                  [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]]
                                                  (lam
                                                    thunk
                                                    Unit
                                                    [
                                                      {
                                                        [
                                                          {
                                                            {
                                                              Tuple2_match
                                                              (con bytestring)
                                                            }
                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]
                                                          }
                                                          ds
                                                        ]
                                                        [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                      }
                                                      (lam
                                                        c
                                                        (con bytestring)
                                                        (lam
                                                          i
                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]
                                                          (let
                                                            (rec)
                                                            (termbind
                                                              (strict)
                                                              (vardecl
                                                                go
                                                                (fun [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]] [List [[Tuple2 (con bytestring)] (con integer)]])
                                                              )
                                                              (lam
                                                                ds
                                                                [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]]
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          {
                                                                            Nil_match
                                                                            [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                          }
                                                                          ds
                                                                        ]
                                                                        (fun Unit [List [[Tuple2 (con bytestring)] (con integer)]])
                                                                      }
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        {
                                                                          Nil
                                                                          [[Tuple2 (con bytestring)] (con integer)]
                                                                        }
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      ds
                                                                      [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                      (lam
                                                                        xs
                                                                        [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]]
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            {
                                                                              [
                                                                                {
                                                                                  {
                                                                                    Tuple2_match
                                                                                    (con bytestring)
                                                                                  }
                                                                                  [[These (con integer)] (con integer)]
                                                                                }
                                                                                ds
                                                                              ]
                                                                              [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                            }
                                                                            (lam
                                                                              c
                                                                              (con bytestring)
                                                                              (lam
                                                                                i
                                                                                [[These (con integer)] (con integer)]
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      Cons
                                                                                      [[Tuple2 (con bytestring)] (con integer)]
                                                                                    }
                                                                                    [
                                                                                      [
                                                                                        {
                                                                                          {
                                                                                            Tuple2
                                                                                            (con bytestring)
                                                                                          }
                                                                                          (con integer)
                                                                                        }
                                                                                        c
                                                                                      ]
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                {
                                                                                                  {
                                                                                                    These_match
                                                                                                    (con integer)
                                                                                                  }
                                                                                                  (con integer)
                                                                                                }
                                                                                                i
                                                                                              ]
                                                                                              (con integer)
                                                                                            }
                                                                                            (lam
                                                                                              b
                                                                                              (con integer)
                                                                                              [
                                                                                                [
                                                                                                  f
                                                                                                  (con
                                                                                                    integer
                                                                                                      0
                                                                                                  )
                                                                                                ]
                                                                                                b
                                                                                              ]
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            a
                                                                                            (con integer)
                                                                                            (lam
                                                                                              b
                                                                                              (con integer)
                                                                                              [
                                                                                                [
                                                                                                  f
                                                                                                  a
                                                                                                ]
                                                                                                b
                                                                                              ]
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          a
                                                                                          (con integer)
                                                                                          [
                                                                                            [
                                                                                              f
                                                                                              a
                                                                                            ]
                                                                                            (con
                                                                                              integer
                                                                                                0
                                                                                            )
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                    ]
                                                                                  ]
                                                                                  [
                                                                                    go
                                                                                    xs
                                                                                  ]
                                                                                ]
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      )
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            )
                                                            [
                                                              [
                                                                {
                                                                  Cons
                                                                  [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                }
                                                                [
                                                                  [
                                                                    {
                                                                      {
                                                                        Tuple2
                                                                        (con bytestring)
                                                                      }
                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                                    }
                                                                    c
                                                                  ]
                                                                  [ go i ]
                                                                ]
                                                              ]
                                                              [ go xs ]
                                                            ]
                                                          )
                                                        )
                                                      )
                                                    ]
                                                  )
                                                )
                                              )
                                            ]
                                            Unit
                                          ]
                                        )
                                      )
                                      [ go [ [ unionVal ls ] rs ] ]
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fAdditiveGroupValue
                                (fun [(lam a (type) a) [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]] (fun [(lam a (type) a) [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]))
                              )
                              (lam
                                ds
                                [(lam a (type) a) [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                (lam
                                  ds
                                  [(lam a (type) a) [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                  [
                                    [ [ unionWith (builtin addInteger) ] ds ]
                                    [
                                      [
                                        fAdditiveGroupValue_cscale
                                        (con integer -1)
                                      ]
                                      ds
                                    ]
                                  ]
                                )
                              )
                            )
                            (datatypebind
                              (datatype
                                (tyvardecl GameInput (type))

                                GameInput_match
                                (vardecl ForgeToken GameInput)
                                (vardecl
                                  Guess
                                  (fun (con bytestring) (fun (con bytestring) (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] GameInput)))
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                contract
                                (fun (con bytestring) (fun (con bytestring) [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]))
                              )
                              (lam
                                mps
                                (con bytestring)
                                (lam
                                  tn
                                  (con bytestring)
                                  [
                                    [
                                      {
                                        Cons
                                        [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                      }
                                      [
                                        [
                                          {
                                            { Tuple2 (con bytestring) }
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                          }
                                          mps
                                        ]
                                        [
                                          [
                                            {
                                              Cons
                                              [[Tuple2 (con bytestring)] (con integer)]
                                            }
                                            [
                                              [
                                                {
                                                  { Tuple2 (con bytestring) }
                                                  (con integer)
                                                }
                                                tn
                                              ]
                                              (con integer 1)
                                            ]
                                          ]
                                          {
                                            Nil
                                            [[Tuple2 (con bytestring)] (con integer)]
                                          }
                                        ]
                                      ]
                                    ]
                                    {
                                      Nil
                                      [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                    }
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                transition
                                (fun [State GameState] (fun GameInput [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]]))
                              )
                              (lam
                                ds
                                [State GameState]
                                (lam
                                  input
                                  GameInput
                                  [
                                    {
                                      [ { State_match GameState } ds ]
                                      [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]]
                                    }
                                    (lam
                                      ds
                                      GameState
                                      (lam
                                        ds
                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                        [
                                          [
                                            {
                                              [ GameState_match ds ]
                                              [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]]
                                            }
                                            (lam
                                              mph
                                              (con bytestring)
                                              (lam
                                                tn
                                                (con bytestring)
                                                (lam
                                                  s
                                                  (con bytestring)
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            GameInput_match
                                                            input
                                                          ]
                                                          (fun Unit [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]])
                                                        }
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            {
                                                              Just
                                                              [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]
                                                            }
                                                            [
                                                              [
                                                                {
                                                                  {
                                                                    Tuple2
                                                                    [[TxConstraints Void] Void]
                                                                  }
                                                                  [State GameState]
                                                                }
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        {
                                                                          TxConstraints
                                                                          Void
                                                                        }
                                                                        Void
                                                                      }
                                                                      [
                                                                        {
                                                                          build
                                                                          TxConstraint
                                                                        }
                                                                        (abs
                                                                          a
                                                                          (type)
                                                                          (lam
                                                                            c
                                                                            (fun TxConstraint (fun a a))
                                                                            (lam
                                                                              n
                                                                              a
                                                                              [
                                                                                [
                                                                                  c
                                                                                  [
                                                                                    [
                                                                                      [
                                                                                        MustForgeValue
                                                                                        mph
                                                                                      ]
                                                                                      tn
                                                                                    ]
                                                                                    (con
                                                                                      integer
                                                                                        1
                                                                                    )
                                                                                  ]
                                                                                ]
                                                                                n
                                                                              ]
                                                                            )
                                                                          )
                                                                        )
                                                                      ]
                                                                    ]
                                                                    {
                                                                      Nil
                                                                      [InputConstraint Void]
                                                                    }
                                                                  ]
                                                                  {
                                                                    Nil
                                                                    [OutputConstraint Void]
                                                                  }
                                                                ]
                                                              ]
                                                              [
                                                                [
                                                                  {
                                                                    State
                                                                    GameState
                                                                  }
                                                                  [
                                                                    [
                                                                      [
                                                                        Locked
                                                                        mph
                                                                      ]
                                                                      tn
                                                                    ]
                                                                    s
                                                                  ]
                                                                ]
                                                                ds
                                                              ]
                                                            ]
                                                          ]
                                                        )
                                                      ]
                                                      (lam
                                                        ipv
                                                        (con bytestring)
                                                        (lam
                                                          ipv
                                                          (con bytestring)
                                                          (lam
                                                            ipv
                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                            (lam
                                                              thunk
                                                              Unit
                                                              {
                                                                Nothing
                                                                [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]
                                                              }
                                                            )
                                                          )
                                                        )
                                                      )
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                          (lam
                                            mph
                                            (con bytestring)
                                            (lam
                                              tn
                                              (con bytestring)
                                              (lam
                                                currentSecret
                                                (con bytestring)
                                                [
                                                  [
                                                    [
                                                      {
                                                        [
                                                          GameInput_match input
                                                        ]
                                                        (fun Unit [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]])
                                                      }
                                                      (lam
                                                        thunk
                                                        Unit
                                                        {
                                                          Nothing
                                                          [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]
                                                        }
                                                      )
                                                    ]
                                                    (lam
                                                      theGuess
                                                      (con bytestring)
                                                      (lam
                                                        nextSecret
                                                        (con bytestring)
                                                        (lam
                                                          takenOut
                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                          (lam
                                                            thunk
                                                            Unit
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      Bool_match
                                                                      [
                                                                        [
                                                                          equalsByteString
                                                                          currentSecret
                                                                        ]
                                                                        [
                                                                          (builtin
                                                                            sha2_256
                                                                          )
                                                                          theGuess
                                                                        ]
                                                                      ]
                                                                    ]
                                                                    (fun Unit [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]])
                                                                  }
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      {
                                                                        Just
                                                                        [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]
                                                                      }
                                                                      [
                                                                        [
                                                                          {
                                                                            {
                                                                              Tuple2
                                                                              [[TxConstraints Void] Void]
                                                                            }
                                                                            [State GameState]
                                                                          }
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  {
                                                                                    TxConstraints
                                                                                    Void
                                                                                  }
                                                                                  Void
                                                                                }
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        {
                                                                                          foldr
                                                                                          TxConstraint
                                                                                        }
                                                                                        [List TxConstraint]
                                                                                      }
                                                                                      {
                                                                                        Cons
                                                                                        TxConstraint
                                                                                      }
                                                                                    ]
                                                                                    [
                                                                                      {
                                                                                        build
                                                                                        TxConstraint
                                                                                      }
                                                                                      (abs
                                                                                        a
                                                                                        (type)
                                                                                        (lam
                                                                                          c
                                                                                          (fun TxConstraint (fun a a))
                                                                                          (lam
                                                                                            n
                                                                                            a
                                                                                            [
                                                                                              [
                                                                                                c
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      MustForgeValue
                                                                                                      mph
                                                                                                    ]
                                                                                                    tn
                                                                                                  ]
                                                                                                  (con
                                                                                                    integer
                                                                                                      0
                                                                                                  )
                                                                                                ]
                                                                                              ]
                                                                                              n
                                                                                            ]
                                                                                          )
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                  ]
                                                                                  [
                                                                                    {
                                                                                      build
                                                                                      TxConstraint
                                                                                    }
                                                                                    (abs
                                                                                      a
                                                                                      (type)
                                                                                      (lam
                                                                                        c
                                                                                        (fun TxConstraint (fun a a))
                                                                                        (lam
                                                                                          n
                                                                                          a
                                                                                          [
                                                                                            [
                                                                                              c
                                                                                              [
                                                                                                MustSpendAtLeast
                                                                                                [
                                                                                                  [
                                                                                                    contract
                                                                                                    mph
                                                                                                  ]
                                                                                                  tn
                                                                                                ]
                                                                                              ]
                                                                                            ]
                                                                                            n
                                                                                          ]
                                                                                        )
                                                                                      )
                                                                                    )
                                                                                  ]
                                                                                ]
                                                                              ]
                                                                              [
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      {
                                                                                        foldr
                                                                                        [InputConstraint Void]
                                                                                      }
                                                                                      [List [InputConstraint Void]]
                                                                                    }
                                                                                    {
                                                                                      Cons
                                                                                      [InputConstraint Void]
                                                                                    }
                                                                                  ]
                                                                                  {
                                                                                    Nil
                                                                                    [InputConstraint Void]
                                                                                  }
                                                                                ]
                                                                                {
                                                                                  Nil
                                                                                  [InputConstraint Void]
                                                                                }
                                                                              ]
                                                                            ]
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    {
                                                                                      foldr
                                                                                      [OutputConstraint Void]
                                                                                    }
                                                                                    [List [OutputConstraint Void]]
                                                                                  }
                                                                                  {
                                                                                    Cons
                                                                                    [OutputConstraint Void]
                                                                                  }
                                                                                ]
                                                                                {
                                                                                  Nil
                                                                                  [OutputConstraint Void]
                                                                                }
                                                                              ]
                                                                              {
                                                                                Nil
                                                                                [OutputConstraint Void]
                                                                              }
                                                                            ]
                                                                          ]
                                                                        ]
                                                                        [
                                                                          [
                                                                            {
                                                                              State
                                                                              GameState
                                                                            }
                                                                            [
                                                                              [
                                                                                [
                                                                                  Locked
                                                                                  mph
                                                                                ]
                                                                                tn
                                                                              ]
                                                                              nextSecret
                                                                            ]
                                                                          ]
                                                                          [
                                                                            [
                                                                              fAdditiveGroupValue
                                                                              ds
                                                                            ]
                                                                            takenOut
                                                                          ]
                                                                        ]
                                                                      ]
                                                                    ]
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  {
                                                                    Nothing
                                                                    [[Tuple2 [[TxConstraints Void] Void]] [State GameState]]
                                                                  }
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                      )
                                                    )
                                                  ]
                                                  Unit
                                                ]
                                              )
                                            )
                                          )
                                        ]
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (nonstrict)
                              (vardecl
                                machine [[StateMachine GameState] GameInput]
                              )
                              [
                                [
                                  [
                                    { { StateMachine GameState } GameInput }
                                    transition
                                  ]
                                  (lam ds GameState False)
                                ]
                                { { mkStateMachine GameState } GameInput }
                              ]
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fIsDataVoid_cfromData (fun Data [Maybe Void])
                              )
                              (lam ds Data { Nothing Void })
                            )
                            (termbind
                              (strict)
                              (vardecl absurd (all a (type) (fun Void a)))
                              (abs a (type) (lam a Void { [ Void_match a ] a }))
                            )
                            (termbind
                              (nonstrict)
                              (vardecl fIsDataVoid [IsData Void])
                              [
                                [ { CConsIsData Void } { absurd Data } ]
                                fIsDataVoid_cfromData
                              ]
                            )
                            (termbind
                              (strict)
                              (vardecl trace (fun (con string) Unit))
                              (lam
                                arg
                                (con string)
                                [
                                  (lam b (con unit) Unit)
                                  [ (builtin trace) arg ]
                                ]
                              )
                            )
                            (datatypebind
                              (datatype
                                (tyvardecl
                                  MultiplicativeMonoid (fun (type) (type))
                                )
                                (tyvardecl a (type))
                                MultiplicativeMonoid_match
                                (vardecl
                                  CConsMultiplicativeMonoid
                                  (fun [(lam a (type) (fun a (fun a a))) a] (fun a [MultiplicativeMonoid a]))
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                p1MultiplicativeMonoid
                                (all a (type) (fun [MultiplicativeMonoid a] [(lam a (type) (fun a (fun a a))) a]))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  v
                                  [MultiplicativeMonoid a]
                                  [
                                    {
                                      [ { MultiplicativeMonoid_match a } v ]
                                      [(lam a (type) (fun a (fun a a))) a]
                                    }
                                    (lam
                                      v
                                      [(lam a (type) (fun a (fun a a))) a]
                                      (lam v a v)
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                one
                                (all a (type) (fun [MultiplicativeMonoid a] a))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  v
                                  [MultiplicativeMonoid a]
                                  [
                                    { [ { MultiplicativeMonoid_match a } v ] a }
                                    (lam
                                      v
                                      [(lam a (type) (fun a (fun a a))) a]
                                      (lam v a v)
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fMonoidProduct
                                (all a (type) (fun [MultiplicativeMonoid a] [Monoid [(lam a (type) a) a]]))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  v
                                  [MultiplicativeMonoid a]
                                  [
                                    [
                                      { CConsMonoid [(lam a (type) a) a] }
                                      (lam
                                        eta
                                        [(lam a (type) a) a]
                                        (lam
                                          eta
                                          [(lam a (type) a) a]
                                          [
                                            [
                                              [ { p1MultiplicativeMonoid a } v ]
                                              eta
                                            ]
                                            eta
                                          ]
                                        )
                                      )
                                    ]
                                    [ { one a } v ]
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl bad_name (fun Bool (fun Bool Bool)))
                              (lam
                                ds
                                Bool
                                (lam
                                  x
                                  Bool
                                  [
                                    [
                                      [
                                        { [ Bool_match ds ] (fun Unit Bool) }
                                        (lam thunk Unit x)
                                      ]
                                      (lam thunk Unit False)
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            )
                            (termbind
                              (nonstrict)
                              (vardecl
                                fMultiplicativeMonoidBool
                                [MultiplicativeMonoid Bool]
                              )
                              [
                                [ { CConsMultiplicativeMonoid Bool } bad_name ]
                                True
                              ]
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fEqTxOutRef_c (fun TxOutRef (fun TxOutRef Bool))
                              )
                              (lam
                                l
                                TxOutRef
                                (lam
                                  r
                                  TxOutRef
                                  [
                                    [
                                      [
                                        {
                                          [
                                            Bool_match
                                            [
                                              [
                                                equalsByteString
                                                [
                                                  {
                                                    [ TxOutRef_match l ]
                                                    (con bytestring)
                                                  }
                                                  (lam
                                                    ds
                                                    (con bytestring)
                                                    (lam ds (con integer) ds)
                                                  )
                                                ]
                                              ]
                                              [
                                                {
                                                  [ TxOutRef_match r ]
                                                  (con bytestring)
                                                }
                                                (lam
                                                  ds
                                                  (con bytestring)
                                                  (lam ds (con integer) ds)
                                                )
                                              ]
                                            ]
                                          ]
                                          (fun Unit Bool)
                                        }
                                        (lam
                                          thunk
                                          Unit
                                          [
                                            [
                                              equalsInteger
                                              [
                                                {
                                                  [ TxOutRef_match l ]
                                                  (con integer)
                                                }
                                                (lam
                                                  ds
                                                  (con bytestring)
                                                  (lam ds (con integer) ds)
                                                )
                                              ]
                                            ]
                                            [
                                              {
                                                [ TxOutRef_match r ]
                                                (con integer)
                                              }
                                              (lam
                                                ds
                                                (con bytestring)
                                                (lam ds (con integer) ds)
                                              )
                                            ]
                                          ]
                                        )
                                      ]
                                      (lam thunk Unit False)
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                checkOwnInputConstraint
                                (all a (type) (fun ScriptContext (fun [InputConstraint a] Bool)))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  ds
                                  ScriptContext
                                  (lam
                                    ds
                                    [InputConstraint a]
                                    [
                                      { [ ScriptContext_match ds ] Bool }
                                      (lam
                                        ds
                                        TxInfo
                                        (lam
                                          ds
                                          ScriptPurpose
                                          [
                                            {
                                              [ { InputConstraint_match a } ds ]
                                              Bool
                                            }
                                            (lam
                                              ds
                                              a
                                              (lam
                                                ds
                                                TxOutRef
                                                [
                                                  { [ TxInfo_match ds ] Bool }
                                                  (lam
                                                    ds
                                                    [List TxInInfo]
                                                    (lam
                                                      ds
                                                      [List TxInInfo]
                                                      (lam
                                                        ds
                                                        [List TxOut]
                                                        (lam
                                                          ds
                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                          (lam
                                                            ds
                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                            (lam
                                                              ds
                                                              [List DCert]
                                                              (lam
                                                                ds
                                                                [List [[Tuple2 StakingCredential] (con integer)]]
                                                                (lam
                                                                  ds
                                                                  [Interval (con integer)]
                                                                  (lam
                                                                    ds
                                                                    [List (con bytestring)]
                                                                    (lam
                                                                      ds
                                                                      [List [[Tuple2 (con bytestring)] Data]]
                                                                      (lam
                                                                        ds
                                                                        (con bytestring)
                                                                        [
                                                                          [
                                                                            [
                                                                              {
                                                                                [
                                                                                  Bool_match
                                                                                  [
                                                                                    [
                                                                                      [
                                                                                        {
                                                                                          {
                                                                                            fFoldableNil_cfoldMap
                                                                                            [(lam a (type) a) Bool]
                                                                                          }
                                                                                          TxInInfo
                                                                                        }
                                                                                        [
                                                                                          {
                                                                                            fMonoidSum
                                                                                            Bool
                                                                                          }
                                                                                          fAdditiveMonoidBool
                                                                                        ]
                                                                                      ]
                                                                                      (lam
                                                                                        ds
                                                                                        TxInInfo
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              TxInInfo_match
                                                                                              ds
                                                                                            ]
                                                                                            Bool
                                                                                          }
                                                                                          (lam
                                                                                            ds
                                                                                            TxOutRef
                                                                                            (lam
                                                                                              ds
                                                                                              TxOut
                                                                                              [
                                                                                                [
                                                                                                  fEqTxOutRef_c
                                                                                                  ds
                                                                                                ]
                                                                                                ds
                                                                                              ]
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    ds
                                                                                  ]
                                                                                ]
                                                                                (fun Unit Bool)
                                                                              }
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                True
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      Unit_match
                                                                                      [
                                                                                        trace
                                                                                        (con
                                                                                          string
                                                                                            "Input constraint"
                                                                                        )
                                                                                      ]
                                                                                    ]
                                                                                    (fun Unit Bool)
                                                                                  }
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    False
                                                                                  )
                                                                                ]
                                                                                Unit
                                                                              ]
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              )
                                                            )
                                                          )
                                                        )
                                                      )
                                                    )
                                                  )
                                                ]
                                              )
                                            )
                                          ]
                                        )
                                      )
                                    ]
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fSemigroupFirst_c
                                (all a (type) (fun [(lam a (type) [Maybe a]) a] (fun [(lam a (type) [Maybe a]) a] [(lam a (type) [Maybe a]) a])))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  ds
                                  [(lam a (type) [Maybe a]) a]
                                  (lam
                                    b
                                    [(lam a (type) [Maybe a]) a]
                                    [
                                      [
                                        [
                                          {
                                            [ { Maybe_match a } ds ]
                                            (fun Unit [(lam a (type) [Maybe a]) a])
                                          }
                                          (lam ipv a (lam thunk Unit ds))
                                        ]
                                        (lam thunk Unit b)
                                      ]
                                      Unit
                                    ]
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fMonoidFirst
                                (all a (type) [Monoid [(lam a (type) [Maybe a]) a]])
                              )
                              (abs
                                a
                                (type)
                                [
                                  [
                                    { CConsMonoid [(lam a (type) [Maybe a]) a] }
                                    { fSemigroupFirst_c a }
                                  ]
                                  { Nothing a }
                                ]
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                findDatumHash
                                (fun Data (fun TxInfo [Maybe (con bytestring)]))
                              )
                              (lam
                                ds
                                Data
                                (lam
                                  ds
                                  TxInfo
                                  [
                                    {
                                      [ TxInfo_match ds ]
                                      [Maybe (con bytestring)]
                                    }
                                    (lam
                                      ds
                                      [List TxInInfo]
                                      (lam
                                        ds
                                        [List TxInInfo]
                                        (lam
                                          ds
                                          [List TxOut]
                                          (lam
                                            ds
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              ds
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                              (lam
                                                ds
                                                [List DCert]
                                                (lam
                                                  ds
                                                  [List [[Tuple2 StakingCredential] (con integer)]]
                                                  (lam
                                                    ds
                                                    [Interval (con integer)]
                                                    (lam
                                                      ds
                                                      [List (con bytestring)]
                                                      (lam
                                                        ds
                                                        [List [[Tuple2 (con bytestring)] Data]]
                                                        (lam
                                                          ds
                                                          (con bytestring)
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  [
                                                                    {
                                                                      Maybe_match
                                                                      [[Tuple2 (con bytestring)] Data]
                                                                    }
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            {
                                                                              fFoldableNil_cfoldMap
                                                                              [(lam a (type) [Maybe a]) [[Tuple2 (con bytestring)] Data]]
                                                                            }
                                                                            [[Tuple2 (con bytestring)] Data]
                                                                          }
                                                                          {
                                                                            fMonoidFirst
                                                                            [[Tuple2 (con bytestring)] Data]
                                                                          }
                                                                        ]
                                                                        (lam
                                                                          x
                                                                          [[Tuple2 (con bytestring)] Data]
                                                                          [
                                                                            {
                                                                              [
                                                                                {
                                                                                  {
                                                                                    Tuple2_match
                                                                                    (con bytestring)
                                                                                  }
                                                                                  Data
                                                                                }
                                                                                x
                                                                              ]
                                                                              [Maybe [[Tuple2 (con bytestring)] Data]]
                                                                            }
                                                                            (lam
                                                                              ds
                                                                              (con bytestring)
                                                                              (lam
                                                                                ds
                                                                                Data
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          Bool_match
                                                                                          [
                                                                                            [
                                                                                              fEqData_c
                                                                                              ds
                                                                                            ]
                                                                                            ds
                                                                                          ]
                                                                                        ]
                                                                                        (fun Unit [Maybe [[Tuple2 (con bytestring)] Data]])
                                                                                      }
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          {
                                                                                            Just
                                                                                            [[Tuple2 (con bytestring)] Data]
                                                                                          }
                                                                                          x
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      {
                                                                                        Nothing
                                                                                        [[Tuple2 (con bytestring)] Data]
                                                                                      }
                                                                                    )
                                                                                  ]
                                                                                  Unit
                                                                                ]
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      ]
                                                                      ds
                                                                    ]
                                                                  ]
                                                                  (fun Unit [Maybe (con bytestring)])
                                                                }
                                                                (lam
                                                                  a
                                                                  [[Tuple2 (con bytestring)] Data]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      {
                                                                        Just
                                                                        (con bytestring)
                                                                      }
                                                                      [
                                                                        {
                                                                          [
                                                                            {
                                                                              {
                                                                                Tuple2_match
                                                                                (con bytestring)
                                                                              }
                                                                              Data
                                                                            }
                                                                            a
                                                                          ]
                                                                          (con bytestring)
                                                                        }
                                                                        (lam
                                                                          a
                                                                          (con bytestring)
                                                                          (lam
                                                                            ds
                                                                            Data
                                                                            a
                                                                          )
                                                                        )
                                                                      ]
                                                                    ]
                                                                  )
                                                                )
                                                              ]
                                                              (lam
                                                                thunk
                                                                Unit
                                                                {
                                                                  Nothing
                                                                  (con bytestring)
                                                                }
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                toData
                                (all a (type) (fun [IsData a] (fun a Data)))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  v
                                  [IsData a]
                                  [
                                    { [ { IsData_match a } v ] (fun a Data) }
                                    (lam
                                      v
                                      (fun a Data)
                                      (lam v (fun Data [Maybe a]) v)
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fEqStakingCredential_c
                                (fun StakingCredential (fun StakingCredential Bool))
                              )
                              (lam
                                ds
                                StakingCredential
                                (lam
                                  ds
                                  StakingCredential
                                  [
                                    [
                                      { [ StakingCredential_match ds ] Bool }
                                      (lam
                                        l
                                        (con bytestring)
                                        [
                                          [
                                            {
                                              [ StakingCredential_match ds ]
                                              Bool
                                            }
                                            (lam
                                              r
                                              (con bytestring)
                                              [ [ equalsByteString l ] r ]
                                            )
                                          ]
                                          (lam
                                            ipv
                                            (con integer)
                                            (lam
                                              ipv
                                              (con integer)
                                              (lam ipv (con integer) False)
                                            )
                                          )
                                        ]
                                      )
                                    ]
                                    (lam
                                      a
                                      (con integer)
                                      (lam
                                        b
                                        (con integer)
                                        (lam
                                          c
                                          (con integer)
                                          [
                                            [
                                              {
                                                [ StakingCredential_match ds ]
                                                Bool
                                              }
                                              (lam ipv (con bytestring) False)
                                            ]
                                            (lam
                                              a
                                              (con integer)
                                              (lam
                                                b
                                                (con integer)
                                                (lam
                                                  c
                                                  (con integer)
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Bool_match
                                                            [
                                                              [
                                                                equalsInteger a
                                                              ]
                                                              a
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  [
                                                                    Bool_match
                                                                    [
                                                                      [
                                                                        equalsInteger
                                                                        b
                                                                      ]
                                                                      b
                                                                    ]
                                                                  ]
                                                                  (fun Unit Bool)
                                                                }
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    [
                                                                      equalsInteger
                                                                      c
                                                                    ]
                                                                    c
                                                                  ]
                                                                )
                                                              ]
                                                              (lam
                                                                thunk Unit False
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      ]
                                                      (lam thunk Unit False)
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              )
                                            )
                                          ]
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fEqAddress_c (fun Address (fun Address Bool))
                              )
                              (lam
                                ds
                                Address
                                (lam
                                  ds
                                  Address
                                  [
                                    { [ Address_match ds ] Bool }
                                    (lam
                                      cred
                                      Credential
                                      (lam
                                        stakingCred
                                        [Maybe StakingCredential]
                                        [
                                          { [ Address_match ds ] Bool }
                                          (lam
                                            cred
                                            Credential
                                            (lam
                                              stakingCred
                                              [Maybe StakingCredential]
                                              (let
                                                (nonrec)
                                                (termbind
                                                  (nonstrict)
                                                  (vardecl j Bool)
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            {
                                                              Maybe_match
                                                              StakingCredential
                                                            }
                                                            stakingCred
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam
                                                          a
                                                          StakingCredential
                                                          (lam
                                                            thunk
                                                            Unit
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      {
                                                                        Maybe_match
                                                                        StakingCredential
                                                                      }
                                                                      stakingCred
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    a
                                                                    StakingCredential
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        [
                                                                          fEqStakingCredential_c
                                                                          a
                                                                        ]
                                                                        a
                                                                      ]
                                                                    )
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  False
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                      ]
                                                      (lam
                                                        thunk
                                                        Unit
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  {
                                                                    Maybe_match
                                                                    StakingCredential
                                                                  }
                                                                  stakingCred
                                                                ]
                                                                (fun Unit Bool)
                                                              }
                                                              (lam
                                                                ipv
                                                                StakingCredential
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  False
                                                                )
                                                              )
                                                            ]
                                                            (lam thunk Unit True
                                                            )
                                                          ]
                                                          Unit
                                                        ]
                                                      )
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                                [
                                                  [
                                                    {
                                                      [ Credential_match cred ]
                                                      Bool
                                                    }
                                                    (lam
                                                      l
                                                      (con bytestring)
                                                      [
                                                        [
                                                          {
                                                            [
                                                              Credential_match
                                                              cred
                                                            ]
                                                            Bool
                                                          }
                                                          (lam
                                                            r
                                                            (con bytestring)
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      Bool_match
                                                                      [
                                                                        [
                                                                          equalsByteString
                                                                          l
                                                                        ]
                                                                        r
                                                                      ]
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    thunk Unit j
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  False
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        ]
                                                        (lam
                                                          ipv
                                                          (con bytestring)
                                                          False
                                                        )
                                                      ]
                                                    )
                                                  ]
                                                  (lam
                                                    a
                                                    (con bytestring)
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Credential_match
                                                            cred
                                                          ]
                                                          Bool
                                                        }
                                                        (lam
                                                          ipv
                                                          (con bytestring)
                                                          False
                                                        )
                                                      ]
                                                      (lam
                                                        a
                                                        (con bytestring)
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  Bool_match
                                                                  [
                                                                    [
                                                                      equalsByteString
                                                                      a
                                                                    ]
                                                                    a
                                                                  ]
                                                                ]
                                                                (fun Unit Bool)
                                                              }
                                                              (lam thunk Unit j)
                                                            ]
                                                            (lam
                                                              thunk Unit False
                                                            )
                                                          ]
                                                          Unit
                                                        ]
                                                      )
                                                    ]
                                                  )
                                                ]
                                              )
                                            )
                                          )
                                        ]
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl error (all a (type) (fun Unit a)))
                              (abs e (type) (lam thunk Unit (error e)))
                            )
                            (termbind
                              (strict)
                              (vardecl
                                findOwnInput
                                (fun ScriptContext [Maybe TxInInfo])
                              )
                              (lam
                                ds
                                ScriptContext
                                [
                                  {
                                    [ ScriptContext_match ds ] [Maybe TxInInfo]
                                  }
                                  (lam
                                    ds
                                    TxInfo
                                    (lam
                                      ds
                                      ScriptPurpose
                                      [
                                        { [ TxInfo_match ds ] [Maybe TxInInfo] }
                                        (lam
                                          ds
                                          [List TxInInfo]
                                          (lam
                                            ds
                                            [List TxInInfo]
                                            (lam
                                              ds
                                              [List TxOut]
                                              (lam
                                                ds
                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                (lam
                                                  ds
                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                  (lam
                                                    ds
                                                    [List DCert]
                                                    (lam
                                                      ds
                                                      [List [[Tuple2 StakingCredential] (con integer)]]
                                                      (lam
                                                        ds
                                                        [Interval (con integer)]
                                                        (lam
                                                          ds
                                                          [List (con bytestring)]
                                                          (lam
                                                            ds
                                                            [List [[Tuple2 (con bytestring)] Data]]
                                                            (lam
                                                              ds
                                                              (con bytestring)
                                                              [
                                                                [
                                                                  [
                                                                    [
                                                                      [
                                                                        {
                                                                          [
                                                                            ScriptPurpose_match
                                                                            ds
                                                                          ]
                                                                          (fun Unit [Maybe TxInInfo])
                                                                        }
                                                                        (lam
                                                                          default_arg0
                                                                          DCert
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            {
                                                                              Nothing
                                                                              TxInInfo
                                                                            }
                                                                          )
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        default_arg0
                                                                        (con bytestring)
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          {
                                                                            Nothing
                                                                            TxInInfo
                                                                          }
                                                                        )
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      default_arg0
                                                                      StakingCredential
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        {
                                                                          Nothing
                                                                          TxInInfo
                                                                        }
                                                                      )
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    txOutRef
                                                                    TxOutRef
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        [
                                                                          [
                                                                            {
                                                                              [
                                                                                {
                                                                                  Nil_match
                                                                                  TxInInfo
                                                                                }
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        {
                                                                                          foldr
                                                                                          TxInInfo
                                                                                        }
                                                                                        [List TxInInfo]
                                                                                      }
                                                                                      (lam
                                                                                        e
                                                                                        TxInInfo
                                                                                        (lam
                                                                                          xs
                                                                                          [List TxInInfo]
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                TxInInfo_match
                                                                                                e
                                                                                              ]
                                                                                              [List TxInInfo]
                                                                                            }
                                                                                            (lam
                                                                                              ds
                                                                                              TxOutRef
                                                                                              (lam
                                                                                                ds
                                                                                                TxOut
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      {
                                                                                                        [
                                                                                                          Bool_match
                                                                                                          [
                                                                                                            [
                                                                                                              fEqTxOutRef_c
                                                                                                              ds
                                                                                                            ]
                                                                                                            txOutRef
                                                                                                          ]
                                                                                                        ]
                                                                                                        (fun Unit [List TxInInfo])
                                                                                                      }
                                                                                                      (lam
                                                                                                        thunk
                                                                                                        Unit
                                                                                                        [
                                                                                                          [
                                                                                                            {
                                                                                                              Cons
                                                                                                              TxInInfo
                                                                                                            }
                                                                                                            e
                                                                                                          ]
                                                                                                          xs
                                                                                                        ]
                                                                                                      )
                                                                                                    ]
                                                                                                    (lam
                                                                                                      thunk
                                                                                                      Unit
                                                                                                      xs
                                                                                                    )
                                                                                                  ]
                                                                                                  Unit
                                                                                                ]
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                    {
                                                                                      Nil
                                                                                      TxInInfo
                                                                                    }
                                                                                  ]
                                                                                  ds
                                                                                ]
                                                                              ]
                                                                              (fun Unit [Maybe TxInInfo])
                                                                            }
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              {
                                                                                Nothing
                                                                                TxInInfo
                                                                              }
                                                                            )
                                                                          ]
                                                                          (lam
                                                                            x
                                                                            TxInInfo
                                                                            (lam
                                                                              ds
                                                                              [List TxInInfo]
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                [
                                                                                  {
                                                                                    Just
                                                                                    TxInInfo
                                                                                  }
                                                                                  x
                                                                                ]
                                                                              )
                                                                            )
                                                                          )
                                                                        ]
                                                                        Unit
                                                                      ]
                                                                    )
                                                                  )
                                                                ]
                                                                Unit
                                                              ]
                                                            )
                                                          )
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      ]
                                    )
                                  )
                                ]
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                getContinuingOutputs
                                (fun ScriptContext [List TxOut])
                              )
                              (lam
                                ctx
                                ScriptContext
                                [
                                  [
                                    [
                                      {
                                        [
                                          { Maybe_match TxInInfo }
                                          [ findOwnInput ctx ]
                                        ]
                                        (fun Unit [List TxOut])
                                      }
                                      (lam
                                        ds
                                        TxInInfo
                                        (lam
                                          thunk
                                          Unit
                                          [
                                            {
                                              [ TxInInfo_match ds ] [List TxOut]
                                            }
                                            (lam
                                              ds
                                              TxOutRef
                                              (lam
                                                ds
                                                TxOut
                                                [
                                                  {
                                                    [ TxOut_match ds ]
                                                    [List TxOut]
                                                  }
                                                  (lam
                                                    ds
                                                    Address
                                                    (lam
                                                      ds
                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                      (lam
                                                        ds
                                                        [Maybe (con bytestring)]
                                                        [
                                                          {
                                                            [
                                                              ScriptContext_match
                                                              ctx
                                                            ]
                                                            [List TxOut]
                                                          }
                                                          (lam
                                                            ds
                                                            TxInfo
                                                            (lam
                                                              ds
                                                              ScriptPurpose
                                                              [
                                                                {
                                                                  [
                                                                    TxInfo_match
                                                                    ds
                                                                  ]
                                                                  [List TxOut]
                                                                }
                                                                (lam
                                                                  ds
                                                                  [List TxInInfo]
                                                                  (lam
                                                                    ds
                                                                    [List TxInInfo]
                                                                    (lam
                                                                      ds
                                                                      [List TxOut]
                                                                      (lam
                                                                        ds
                                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                        (lam
                                                                          ds
                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                          (lam
                                                                            ds
                                                                            [List DCert]
                                                                            (lam
                                                                              ds
                                                                              [List [[Tuple2 StakingCredential] (con integer)]]
                                                                              (lam
                                                                                ds
                                                                                [Interval (con integer)]
                                                                                (lam
                                                                                  ds
                                                                                  [List (con bytestring)]
                                                                                  (lam
                                                                                    ds
                                                                                    [List [[Tuple2 (con bytestring)] Data]]
                                                                                    (lam
                                                                                      ds
                                                                                      (con bytestring)
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              {
                                                                                                foldr
                                                                                                TxOut
                                                                                              }
                                                                                              [List TxOut]
                                                                                            }
                                                                                            (lam
                                                                                              e
                                                                                              TxOut
                                                                                              (lam
                                                                                                xs
                                                                                                [List TxOut]
                                                                                                [
                                                                                                  {
                                                                                                    [
                                                                                                      TxOut_match
                                                                                                      e
                                                                                                    ]
                                                                                                    [List TxOut]
                                                                                                  }
                                                                                                  (lam
                                                                                                    ds
                                                                                                    Address
                                                                                                    (lam
                                                                                                      ds
                                                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                      (lam
                                                                                                        ds
                                                                                                        [Maybe (con bytestring)]
                                                                                                        [
                                                                                                          [
                                                                                                            [
                                                                                                              {
                                                                                                                [
                                                                                                                  Bool_match
                                                                                                                  [
                                                                                                                    [
                                                                                                                      fEqAddress_c
                                                                                                                      ds
                                                                                                                    ]
                                                                                                                    ds
                                                                                                                  ]
                                                                                                                ]
                                                                                                                (fun Unit [List TxOut])
                                                                                                              }
                                                                                                              (lam
                                                                                                                thunk
                                                                                                                Unit
                                                                                                                [
                                                                                                                  [
                                                                                                                    {
                                                                                                                      Cons
                                                                                                                      TxOut
                                                                                                                    }
                                                                                                                    e
                                                                                                                  ]
                                                                                                                  xs
                                                                                                                ]
                                                                                                              )
                                                                                                            ]
                                                                                                            (lam
                                                                                                              thunk
                                                                                                              Unit
                                                                                                              xs
                                                                                                            )
                                                                                                          ]
                                                                                                          Unit
                                                                                                        ]
                                                                                                      )
                                                                                                    )
                                                                                                  )
                                                                                                ]
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                          {
                                                                                            Nil
                                                                                            TxOut
                                                                                          }
                                                                                        ]
                                                                                        ds
                                                                                      ]
                                                                                    )
                                                                                  )
                                                                                )
                                                                              )
                                                                            )
                                                                          )
                                                                        )
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              ]
                                                            )
                                                          )
                                                        ]
                                                      )
                                                    )
                                                  )
                                                ]
                                              )
                                            )
                                          ]
                                        )
                                      )
                                    ]
                                    (lam
                                      thunk Unit [ { error [List TxOut] } Unit ]
                                    )
                                  ]
                                  Unit
                                ]
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                checkBinRel
                                (fun (fun (con integer) (fun (con integer) Bool)) (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] Bool)))
                              )
                              (lam
                                f
                                (fun (con integer) (fun (con integer) Bool))
                                (lam
                                  l
                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                  (lam
                                    r
                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                    (let
                                      (rec)
                                      (termbind
                                        (strict)
                                        (vardecl
                                          go
                                          (fun [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]] Bool)
                                        )
                                        (lam
                                          xs
                                          [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]]
                                          [
                                            [
                                              [
                                                {
                                                  [
                                                    {
                                                      Nil_match
                                                      [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]
                                                    }
                                                    xs
                                                  ]
                                                  (fun Unit Bool)
                                                }
                                                (lam thunk Unit True)
                                              ]
                                              (lam
                                                ds
                                                [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]
                                                (lam
                                                  xs
                                                  [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]]]
                                                  (lam
                                                    thunk
                                                    Unit
                                                    [
                                                      {
                                                        [
                                                          {
                                                            {
                                                              Tuple2_match
                                                              (con bytestring)
                                                            }
                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]
                                                          }
                                                          ds
                                                        ]
                                                        Bool
                                                      }
                                                      (lam
                                                        ds
                                                        (con bytestring)
                                                        (lam
                                                          x
                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[These (con integer)] (con integer)]]
                                                          (let
                                                            (rec)
                                                            (termbind
                                                              (strict)
                                                              (vardecl
                                                                go
                                                                (fun [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]] Bool)
                                                              )
                                                              (lam
                                                                xs
                                                                [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]]
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          {
                                                                            Nil_match
                                                                            [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                          }
                                                                          xs
                                                                        ]
                                                                        (fun Unit Bool)
                                                                      }
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          go xs
                                                                        ]
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      ds
                                                                      [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]
                                                                      (lam
                                                                        xs
                                                                        [List [[Tuple2 (con bytestring)] [[These (con integer)] (con integer)]]]
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            {
                                                                              [
                                                                                {
                                                                                  {
                                                                                    Tuple2_match
                                                                                    (con bytestring)
                                                                                  }
                                                                                  [[These (con integer)] (con integer)]
                                                                                }
                                                                                ds
                                                                              ]
                                                                              Bool
                                                                            }
                                                                            (lam
                                                                              ds
                                                                              (con bytestring)
                                                                              (lam
                                                                                x
                                                                                [[These (con integer)] (con integer)]
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          {
                                                                                            {
                                                                                              These_match
                                                                                              (con integer)
                                                                                            }
                                                                                            (con integer)
                                                                                          }
                                                                                          x
                                                                                        ]
                                                                                        Bool
                                                                                      }
                                                                                      (lam
                                                                                        b
                                                                                        (con integer)
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              {
                                                                                                [
                                                                                                  Bool_match
                                                                                                  [
                                                                                                    [
                                                                                                      f
                                                                                                      (con
                                                                                                        integer
                                                                                                          0
                                                                                                      )
                                                                                                    ]
                                                                                                    b
                                                                                                  ]
                                                                                                ]
                                                                                                (fun Unit Bool)
                                                                                              }
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  go
                                                                                                  xs
                                                                                                ]
                                                                                              )
                                                                                            ]
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              False
                                                                                            )
                                                                                          ]
                                                                                          Unit
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      a
                                                                                      (con integer)
                                                                                      (lam
                                                                                        b
                                                                                        (con integer)
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              {
                                                                                                [
                                                                                                  Bool_match
                                                                                                  [
                                                                                                    [
                                                                                                      f
                                                                                                      a
                                                                                                    ]
                                                                                                    b
                                                                                                  ]
                                                                                                ]
                                                                                                (fun Unit Bool)
                                                                                              }
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  go
                                                                                                  xs
                                                                                                ]
                                                                                              )
                                                                                            ]
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              False
                                                                                            )
                                                                                          ]
                                                                                          Unit
                                                                                        ]
                                                                                      )
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    a
                                                                                    (con integer)
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              Bool_match
                                                                                              [
                                                                                                [
                                                                                                  f
                                                                                                  a
                                                                                                ]
                                                                                                (con
                                                                                                  integer
                                                                                                    0
                                                                                                )
                                                                                              ]
                                                                                            ]
                                                                                            (fun Unit Bool)
                                                                                          }
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            [
                                                                                              go
                                                                                              xs
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          False
                                                                                        )
                                                                                      ]
                                                                                      Unit
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      )
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            )
                                                            [ go x ]
                                                          )
                                                        )
                                                      )
                                                    ]
                                                  )
                                                )
                                              )
                                            ]
                                            Unit
                                          ]
                                        )
                                      )
                                      [ go [ [ unionVal l ] r ] ]
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                checkOwnOutputConstraint
                                (all o (type) (fun [IsData o] (fun ScriptContext (fun [OutputConstraint o] Bool))))
                              )
                              (abs
                                o
                                (type)
                                (lam
                                  dIsData
                                  [IsData o]
                                  (lam
                                    ctx
                                    ScriptContext
                                    (lam
                                      ds
                                      [OutputConstraint o]
                                      [
                                        { [ ScriptContext_match ctx ] Bool }
                                        (lam
                                          ds
                                          TxInfo
                                          (lam
                                            ds
                                            ScriptPurpose
                                            [
                                              {
                                                [
                                                  { OutputConstraint_match o }
                                                  ds
                                                ]
                                                Bool
                                              }
                                              (lam
                                                ds
                                                o
                                                (lam
                                                  ds
                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                  (let
                                                    (nonrec)
                                                    (termbind
                                                      (nonstrict)
                                                      (vardecl
                                                        hsh
                                                        [Maybe (con bytestring)]
                                                      )
                                                      [
                                                        [
                                                          findDatumHash
                                                          [
                                                            [
                                                              { toData o }
                                                              dIsData
                                                            ]
                                                            ds
                                                          ]
                                                        ]
                                                        ds
                                                      ]
                                                    )
                                                    [
                                                      [
                                                        [
                                                          {
                                                            [
                                                              Bool_match
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      {
                                                                        fFoldableNil_cfoldMap
                                                                        [(lam a (type) a) Bool]
                                                                      }
                                                                      TxOut
                                                                    }
                                                                    [
                                                                      {
                                                                        fMonoidSum
                                                                        Bool
                                                                      }
                                                                      fAdditiveMonoidBool
                                                                    ]
                                                                  ]
                                                                  (lam
                                                                    ds
                                                                    TxOut
                                                                    [
                                                                      {
                                                                        [
                                                                          TxOut_match
                                                                          ds
                                                                        ]
                                                                        Bool
                                                                      }
                                                                      (lam
                                                                        ds
                                                                        Address
                                                                        (lam
                                                                          ds
                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                          (lam
                                                                            ds
                                                                            [Maybe (con bytestring)]
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      {
                                                                                        Maybe_match
                                                                                        (con bytestring)
                                                                                      }
                                                                                      ds
                                                                                    ]
                                                                                    (fun Unit Bool)
                                                                                  }
                                                                                  (lam
                                                                                    svh
                                                                                    (con bytestring)
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                Bool_match
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      checkBinRel
                                                                                                      equalsInteger
                                                                                                    ]
                                                                                                    ds
                                                                                                  ]
                                                                                                  ds
                                                                                                ]
                                                                                              ]
                                                                                              (fun Unit Bool)
                                                                                            }
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              [
                                                                                                [
                                                                                                  [
                                                                                                    {
                                                                                                      [
                                                                                                        {
                                                                                                          Maybe_match
                                                                                                          (con bytestring)
                                                                                                        }
                                                                                                        hsh
                                                                                                      ]
                                                                                                      (fun Unit Bool)
                                                                                                    }
                                                                                                    (lam
                                                                                                      a
                                                                                                      (con bytestring)
                                                                                                      (lam
                                                                                                        thunk
                                                                                                        Unit
                                                                                                        [
                                                                                                          [
                                                                                                            equalsByteString
                                                                                                            a
                                                                                                          ]
                                                                                                          svh
                                                                                                        ]
                                                                                                      )
                                                                                                    )
                                                                                                  ]
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    False
                                                                                                  )
                                                                                                ]
                                                                                                Unit
                                                                                              ]
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            False
                                                                                          )
                                                                                        ]
                                                                                        Unit
                                                                                      ]
                                                                                    )
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  False
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        )
                                                                      )
                                                                    ]
                                                                  )
                                                                ]
                                                                [
                                                                  getContinuingOutputs
                                                                  ctx
                                                                ]
                                                              ]
                                                            ]
                                                            (fun Unit Bool)
                                                          }
                                                          (lam thunk Unit True)
                                                        ]
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  Unit_match
                                                                  [
                                                                    trace
                                                                    (con
                                                                      string
                                                                        "Output constraint"
                                                                    )
                                                                  ]
                                                                ]
                                                                (fun Unit Bool)
                                                              }
                                                              (lam
                                                                thunk Unit False
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      ]
                                                      Unit
                                                    ]
                                                  )
                                                )
                                              )
                                            ]
                                          )
                                        )
                                      ]
                                    )
                                  )
                                )
                              )
                            )
                            (datatypebind
                              (datatype
                                (tyvardecl Ordering (type))

                                Ordering_match
                                (vardecl EQ Ordering)
                                (vardecl GT Ordering)
                                (vardecl LT Ordering)
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                lessThanEqInteger
                                (fun (con integer) (fun (con integer) Bool))
                              )
                              (lam
                                arg
                                (con integer)
                                (lam
                                  arg
                                  (con integer)
                                  [
                                    (lam
                                      b
                                      (con bool)
                                      [
                                        [
                                          [ { (builtin ifThenElse) Bool } b ]
                                          True
                                        ]
                                        False
                                      ]
                                    )
                                    [
                                      [ (builtin lessThanEqualsInteger) arg ]
                                      arg
                                    ]
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fOrdData_ccompare
                                (fun (con integer) (fun (con integer) Ordering))
                              )
                              (lam
                                x
                                (con integer)
                                (lam
                                  y
                                  (con integer)
                                  [
                                    [
                                      [
                                        {
                                          [
                                            Bool_match [ [ equalsInteger x ] y ]
                                          ]
                                          (fun Unit Ordering)
                                        }
                                        (lam thunk Unit EQ)
                                      ]
                                      (lam
                                        thunk
                                        Unit
                                        [
                                          [
                                            [
                                              {
                                                [
                                                  Bool_match
                                                  [ [ lessThanEqInteger x ] y ]
                                                ]
                                                (fun Unit Ordering)
                                              }
                                              (lam thunk Unit LT)
                                            ]
                                            (lam thunk Unit GT)
                                          ]
                                          Unit
                                        ]
                                      )
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fOrdInteger_cmax
                                (fun (con integer) (fun (con integer) (con integer)))
                              )
                              (lam
                                x
                                (con integer)
                                (lam
                                  y
                                  (con integer)
                                  [
                                    [
                                      [
                                        {
                                          [
                                            Bool_match
                                            [ [ lessThanEqInteger x ] y ]
                                          ]
                                          (fun Unit (con integer))
                                        }
                                        (lam thunk Unit y)
                                      ]
                                      (lam thunk Unit x)
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fOrdInteger_cmin
                                (fun (con integer) (fun (con integer) (con integer)))
                              )
                              (lam
                                x
                                (con integer)
                                (lam
                                  y
                                  (con integer)
                                  [
                                    [
                                      [
                                        {
                                          [
                                            Bool_match
                                            [ [ lessThanEqInteger x ] y ]
                                          ]
                                          (fun Unit (con integer))
                                        }
                                        (lam thunk Unit x)
                                      ]
                                      (lam thunk Unit y)
                                    ]
                                    Unit
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                greaterThanEqInteger
                                (fun (con integer) (fun (con integer) Bool))
                              )
                              (lam
                                arg
                                (con integer)
                                (lam
                                  arg
                                  (con integer)
                                  [
                                    (lam
                                      b
                                      (con bool)
                                      [
                                        [
                                          [ { (builtin ifThenElse) Bool } b ]
                                          True
                                        ]
                                        False
                                      ]
                                    )
                                    [
                                      [ (builtin greaterThanEqualsInteger) arg ]
                                      arg
                                    ]
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                greaterThanInteger
                                (fun (con integer) (fun (con integer) Bool))
                              )
                              (lam
                                arg
                                (con integer)
                                (lam
                                  arg
                                  (con integer)
                                  [
                                    (lam
                                      b
                                      (con bool)
                                      [
                                        [
                                          [ { (builtin ifThenElse) Bool } b ]
                                          True
                                        ]
                                        False
                                      ]
                                    )
                                    [ [ (builtin greaterThanInteger) arg ] arg ]
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                lessThanInteger
                                (fun (con integer) (fun (con integer) Bool))
                              )
                              (lam
                                arg
                                (con integer)
                                (lam
                                  arg
                                  (con integer)
                                  [
                                    (lam
                                      b
                                      (con bool)
                                      [
                                        [
                                          [ { (builtin ifThenElse) Bool } b ]
                                          True
                                        ]
                                        False
                                      ]
                                    )
                                    [ [ (builtin lessThanInteger) arg ] arg ]
                                  ]
                                )
                              )
                            )
                            (datatypebind
                              (datatype
                                (tyvardecl Ord (fun (type) (type)))
                                (tyvardecl a (type))
                                Ord_match
                                (vardecl
                                  CConsOrd
                                  (fun [(lam a (type) (fun a (fun a Bool))) a] (fun (fun a (fun a Ordering)) (fun (fun a (fun a Bool)) (fun (fun a (fun a Bool)) (fun (fun a (fun a Bool)) (fun (fun a (fun a Bool)) (fun (fun a (fun a a)) (fun (fun a (fun a a)) [Ord a]))))))))
                                )
                              )
                            )
                            (termbind
                              (nonstrict)
                              (vardecl fOrdSlot [Ord (con integer)])
                              [
                                [
                                  [
                                    [
                                      [
                                        [
                                          [
                                            [
                                              { CConsOrd (con integer) }
                                              equalsInteger
                                            ]
                                            fOrdData_ccompare
                                          ]
                                          lessThanInteger
                                        ]
                                        lessThanEqInteger
                                      ]
                                      greaterThanInteger
                                    ]
                                    greaterThanEqInteger
                                  ]
                                  fOrdInteger_cmax
                                ]
                                fOrdInteger_cmin
                              ]
                            )
                            (termbind
                              (strict)
                              (vardecl
                                compare
                                (all a (type) (fun [Ord a] (fun a (fun a Ordering))))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  v
                                  [Ord a]
                                  [
                                    {
                                      [ { Ord_match a } v ]
                                      (fun a (fun a Ordering))
                                    }
                                    (lam
                                      v
                                      [(lam a (type) (fun a (fun a Bool))) a]
                                      (lam
                                        v
                                        (fun a (fun a Ordering))
                                        (lam
                                          v
                                          (fun a (fun a Bool))
                                          (lam
                                            v
                                            (fun a (fun a Bool))
                                            (lam
                                              v
                                              (fun a (fun a Bool))
                                              (lam
                                                v
                                                (fun a (fun a Bool))
                                                (lam
                                                  v
                                                  (fun a (fun a a))
                                                  (lam v (fun a (fun a a)) v)
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                hull_ccompare
                                (all a (type) (fun [Ord a] (fun [Extended a] (fun [Extended a] Ordering))))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  dOrd
                                  [Ord a]
                                  (lam
                                    ds
                                    [Extended a]
                                    (lam
                                      ds
                                      [Extended a]
                                      (let
                                        (nonrec)
                                        (termbind
                                          (strict)
                                          (vardecl
                                            fail (fun (all a (type) a) Ordering)
                                          )
                                          (lam
                                            ds
                                            (all a (type) a)
                                            {
                                              (abs e (type) (error e)) Ordering
                                            }
                                          )
                                        )
                                        [
                                          [
                                            [
                                              [
                                                {
                                                  [ { Extended_match a } ds ]
                                                  (fun Unit Ordering)
                                                }
                                                (lam
                                                  default_arg0
                                                  a
                                                  (lam
                                                    thunk
                                                    Unit
                                                    [
                                                      [
                                                        [
                                                          [
                                                            {
                                                              [
                                                                {
                                                                  Extended_match
                                                                  a
                                                                }
                                                                ds
                                                              ]
                                                              (fun Unit Ordering)
                                                            }
                                                            (lam
                                                              default_arg0
                                                              a
                                                              (lam
                                                                thunk
                                                                Unit
                                                                (let
                                                                  (nonrec)
                                                                  (termbind
                                                                    (strict)
                                                                    (vardecl
                                                                      fail
                                                                      (fun (all a (type) a) Ordering)
                                                                    )
                                                                    (lam
                                                                      ds
                                                                      (all a (type) a)
                                                                      [
                                                                        [
                                                                          [
                                                                            [
                                                                              {
                                                                                [
                                                                                  {
                                                                                    Extended_match
                                                                                    a
                                                                                  }
                                                                                  ds
                                                                                ]
                                                                                (fun Unit Ordering)
                                                                              }
                                                                              (lam
                                                                                default_arg0
                                                                                a
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  [
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              {
                                                                                                Extended_match
                                                                                                a
                                                                                              }
                                                                                              ds
                                                                                            ]
                                                                                            (fun Unit Ordering)
                                                                                          }
                                                                                          (lam
                                                                                            l
                                                                                            a
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              [
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      {
                                                                                                        [
                                                                                                          {
                                                                                                            Extended_match
                                                                                                            a
                                                                                                          }
                                                                                                          ds
                                                                                                        ]
                                                                                                        (fun Unit Ordering)
                                                                                                      }
                                                                                                      (lam
                                                                                                        r
                                                                                                        a
                                                                                                        (lam
                                                                                                          thunk
                                                                                                          Unit
                                                                                                          [
                                                                                                            [
                                                                                                              [
                                                                                                                {
                                                                                                                  compare
                                                                                                                  a
                                                                                                                }
                                                                                                                dOrd
                                                                                                              ]
                                                                                                              l
                                                                                                            ]
                                                                                                            r
                                                                                                          ]
                                                                                                        )
                                                                                                      )
                                                                                                    ]
                                                                                                    (lam
                                                                                                      thunk
                                                                                                      Unit
                                                                                                      [
                                                                                                        fail
                                                                                                        (abs
                                                                                                          e
                                                                                                          (type)
                                                                                                          (error
                                                                                                            e
                                                                                                          )
                                                                                                        )
                                                                                                      ]
                                                                                                    )
                                                                                                  ]
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    [
                                                                                                      fail
                                                                                                      (abs
                                                                                                        e
                                                                                                        (type)
                                                                                                        (error
                                                                                                          e
                                                                                                        )
                                                                                                      )
                                                                                                    ]
                                                                                                  )
                                                                                                ]
                                                                                                Unit
                                                                                              ]
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            fail
                                                                                            (abs
                                                                                              e
                                                                                              (type)
                                                                                              (error
                                                                                                e
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        GT
                                                                                      )
                                                                                    ]
                                                                                    Unit
                                                                                  ]
                                                                                )
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          {
                                                                                            Extended_match
                                                                                            a
                                                                                          }
                                                                                          ds
                                                                                        ]
                                                                                        (fun Unit Ordering)
                                                                                      }
                                                                                      (lam
                                                                                        l
                                                                                        a
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            [
                                                                                              [
                                                                                                [
                                                                                                  {
                                                                                                    [
                                                                                                      {
                                                                                                        Extended_match
                                                                                                        a
                                                                                                      }
                                                                                                      ds
                                                                                                    ]
                                                                                                    (fun Unit Ordering)
                                                                                                  }
                                                                                                  (lam
                                                                                                    r
                                                                                                    a
                                                                                                    (lam
                                                                                                      thunk
                                                                                                      Unit
                                                                                                      [
                                                                                                        [
                                                                                                          [
                                                                                                            {
                                                                                                              compare
                                                                                                              a
                                                                                                            }
                                                                                                            dOrd
                                                                                                          ]
                                                                                                          l
                                                                                                        ]
                                                                                                        r
                                                                                                      ]
                                                                                                    )
                                                                                                  )
                                                                                                ]
                                                                                                (lam
                                                                                                  thunk
                                                                                                  Unit
                                                                                                  [
                                                                                                    fail
                                                                                                    (abs
                                                                                                      e
                                                                                                      (type)
                                                                                                      (error
                                                                                                        e
                                                                                                      )
                                                                                                    )
                                                                                                  ]
                                                                                                )
                                                                                              ]
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  fail
                                                                                                  (abs
                                                                                                    e
                                                                                                    (type)
                                                                                                    (error
                                                                                                      e
                                                                                                    )
                                                                                                  )
                                                                                                ]
                                                                                              )
                                                                                            ]
                                                                                            Unit
                                                                                          ]
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      [
                                                                                        fail
                                                                                        (abs
                                                                                          e
                                                                                          (type)
                                                                                          (error
                                                                                            e
                                                                                          )
                                                                                        )
                                                                                      ]
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    GT
                                                                                  )
                                                                                ]
                                                                                Unit
                                                                              ]
                                                                            )
                                                                          ]
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            LT
                                                                          )
                                                                        ]
                                                                        Unit
                                                                      ]
                                                                    )
                                                                  )
                                                                  [
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                Extended_match
                                                                                a
                                                                              }
                                                                              ds
                                                                            ]
                                                                            (fun Unit Ordering)
                                                                          }
                                                                          (lam
                                                                            default_arg0
                                                                            a
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                fail
                                                                                (abs
                                                                                  e
                                                                                  (type)
                                                                                  (error
                                                                                    e
                                                                                  )
                                                                                )
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            fail
                                                                            (abs
                                                                              e
                                                                              (type)
                                                                              (error
                                                                                e
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  [
                                                                                    {
                                                                                      Extended_match
                                                                                      a
                                                                                    }
                                                                                    ds
                                                                                  ]
                                                                                  (fun Unit Ordering)
                                                                                }
                                                                                (lam
                                                                                  default_arg0
                                                                                  a
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      fail
                                                                                      (abs
                                                                                        e
                                                                                        (type)
                                                                                        (error
                                                                                          e
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                  )
                                                                                )
                                                                              ]
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                [
                                                                                  fail
                                                                                  (abs
                                                                                    e
                                                                                    (type)
                                                                                    (error
                                                                                      e
                                                                                    )
                                                                                  )
                                                                                ]
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              EQ
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                              )
                                                            )
                                                          ]
                                                          (lam thunk Unit GT)
                                                        ]
                                                        (lam
                                                          thunk
                                                          Unit
                                                          (let
                                                            (nonrec)
                                                            (termbind
                                                              (strict)
                                                              (vardecl
                                                                fail
                                                                (fun (all a (type) a) Ordering)
                                                              )
                                                              (lam
                                                                ds
                                                                (all a (type) a)
                                                                [
                                                                  [
                                                                    [
                                                                      [
                                                                        {
                                                                          [
                                                                            {
                                                                              Extended_match
                                                                              a
                                                                            }
                                                                            ds
                                                                          ]
                                                                          (fun Unit Ordering)
                                                                        }
                                                                        (lam
                                                                          default_arg0
                                                                          a
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            [
                                                                              [
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      [
                                                                                        {
                                                                                          Extended_match
                                                                                          a
                                                                                        }
                                                                                        ds
                                                                                      ]
                                                                                      (fun Unit Ordering)
                                                                                    }
                                                                                    (lam
                                                                                      l
                                                                                      a
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  [
                                                                                                    {
                                                                                                      Extended_match
                                                                                                      a
                                                                                                    }
                                                                                                    ds
                                                                                                  ]
                                                                                                  (fun Unit Ordering)
                                                                                                }
                                                                                                (lam
                                                                                                  r
                                                                                                  a
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    [
                                                                                                      [
                                                                                                        [
                                                                                                          {
                                                                                                            compare
                                                                                                            a
                                                                                                          }
                                                                                                          dOrd
                                                                                                        ]
                                                                                                        l
                                                                                                      ]
                                                                                                      r
                                                                                                    ]
                                                                                                  )
                                                                                                )
                                                                                              ]
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  fail
                                                                                                  (abs
                                                                                                    e
                                                                                                    (type)
                                                                                                    (error
                                                                                                      e
                                                                                                    )
                                                                                                  )
                                                                                                ]
                                                                                              )
                                                                                            ]
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              [
                                                                                                fail
                                                                                                (abs
                                                                                                  e
                                                                                                  (type)
                                                                                                  (error
                                                                                                    e
                                                                                                  )
                                                                                                )
                                                                                              ]
                                                                                            )
                                                                                          ]
                                                                                          Unit
                                                                                        ]
                                                                                      )
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      fail
                                                                                      (abs
                                                                                        e
                                                                                        (type)
                                                                                        (error
                                                                                          e
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  GT
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  [
                                                                                    {
                                                                                      Extended_match
                                                                                      a
                                                                                    }
                                                                                    ds
                                                                                  ]
                                                                                  (fun Unit Ordering)
                                                                                }
                                                                                (lam
                                                                                  l
                                                                                  a
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                {
                                                                                                  Extended_match
                                                                                                  a
                                                                                                }
                                                                                                ds
                                                                                              ]
                                                                                              (fun Unit Ordering)
                                                                                            }
                                                                                            (lam
                                                                                              r
                                                                                              a
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      {
                                                                                                        compare
                                                                                                        a
                                                                                                      }
                                                                                                      dOrd
                                                                                                    ]
                                                                                                    l
                                                                                                  ]
                                                                                                  r
                                                                                                ]
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            [
                                                                                              fail
                                                                                              (abs
                                                                                                e
                                                                                                (type)
                                                                                                (error
                                                                                                  e
                                                                                                )
                                                                                              )
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            fail
                                                                                            (abs
                                                                                              e
                                                                                              (type)
                                                                                              (error
                                                                                                e
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                      Unit
                                                                                    ]
                                                                                  )
                                                                                )
                                                                              ]
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                [
                                                                                  fail
                                                                                  (abs
                                                                                    e
                                                                                    (type)
                                                                                    (error
                                                                                      e
                                                                                    )
                                                                                  )
                                                                                ]
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              GT
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      LT
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            )
                                                            [
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      [
                                                                        {
                                                                          Extended_match
                                                                          a
                                                                        }
                                                                        ds
                                                                      ]
                                                                      (fun Unit Ordering)
                                                                    }
                                                                    (lam
                                                                      default_arg0
                                                                      a
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          fail
                                                                          (abs
                                                                            e
                                                                            (type)
                                                                            (error
                                                                              e
                                                                            )
                                                                          )
                                                                        ]
                                                                      )
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      fail
                                                                      (abs
                                                                        e
                                                                        (type)
                                                                        (error e
                                                                        )
                                                                      )
                                                                    ]
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                Extended_match
                                                                                a
                                                                              }
                                                                              ds
                                                                            ]
                                                                            (fun Unit Ordering)
                                                                          }
                                                                          (lam
                                                                            default_arg0
                                                                            a
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                fail
                                                                                (abs
                                                                                  e
                                                                                  (type)
                                                                                  (error
                                                                                    e
                                                                                  )
                                                                                )
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            fail
                                                                            (abs
                                                                              e
                                                                              (type)
                                                                              (error
                                                                                e
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        EQ
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                      ]
                                                      Unit
                                                    ]
                                                  )
                                                )
                                              ]
                                              (lam
                                                thunk
                                                Unit
                                                [
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            { Extended_match a }
                                                            ds
                                                          ]
                                                          (fun Unit Ordering)
                                                        }
                                                        (lam
                                                          default_arg0
                                                          a
                                                          (lam thunk Unit LT)
                                                        )
                                                      ]
                                                      (lam thunk Unit EQ)
                                                    ]
                                                    (lam thunk Unit LT)
                                                  ]
                                                  Unit
                                                ]
                                              )
                                            ]
                                            (lam
                                              thunk
                                              Unit
                                              [
                                                [
                                                  [
                                                    [
                                                      {
                                                        [
                                                          { Extended_match a }
                                                          ds
                                                        ]
                                                        (fun Unit Ordering)
                                                      }
                                                      (lam
                                                        default_arg0
                                                        a
                                                        (lam
                                                          thunk
                                                          Unit
                                                          (let
                                                            (nonrec)
                                                            (termbind
                                                              (strict)
                                                              (vardecl
                                                                fail
                                                                (fun (all a (type) a) Ordering)
                                                              )
                                                              (lam
                                                                ds
                                                                (all a (type) a)
                                                                [
                                                                  [
                                                                    [
                                                                      [
                                                                        {
                                                                          [
                                                                            {
                                                                              Extended_match
                                                                              a
                                                                            }
                                                                            ds
                                                                          ]
                                                                          (fun Unit Ordering)
                                                                        }
                                                                        (lam
                                                                          default_arg0
                                                                          a
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            [
                                                                              [
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      [
                                                                                        {
                                                                                          Extended_match
                                                                                          a
                                                                                        }
                                                                                        ds
                                                                                      ]
                                                                                      (fun Unit Ordering)
                                                                                    }
                                                                                    (lam
                                                                                      l
                                                                                      a
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  [
                                                                                                    {
                                                                                                      Extended_match
                                                                                                      a
                                                                                                    }
                                                                                                    ds
                                                                                                  ]
                                                                                                  (fun Unit Ordering)
                                                                                                }
                                                                                                (lam
                                                                                                  r
                                                                                                  a
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    [
                                                                                                      [
                                                                                                        [
                                                                                                          {
                                                                                                            compare
                                                                                                            a
                                                                                                          }
                                                                                                          dOrd
                                                                                                        ]
                                                                                                        l
                                                                                                      ]
                                                                                                      r
                                                                                                    ]
                                                                                                  )
                                                                                                )
                                                                                              ]
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  fail
                                                                                                  (abs
                                                                                                    e
                                                                                                    (type)
                                                                                                    (error
                                                                                                      e
                                                                                                    )
                                                                                                  )
                                                                                                ]
                                                                                              )
                                                                                            ]
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              [
                                                                                                fail
                                                                                                (abs
                                                                                                  e
                                                                                                  (type)
                                                                                                  (error
                                                                                                    e
                                                                                                  )
                                                                                                )
                                                                                              ]
                                                                                            )
                                                                                          ]
                                                                                          Unit
                                                                                        ]
                                                                                      )
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      fail
                                                                                      (abs
                                                                                        e
                                                                                        (type)
                                                                                        (error
                                                                                          e
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  GT
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  [
                                                                                    {
                                                                                      Extended_match
                                                                                      a
                                                                                    }
                                                                                    ds
                                                                                  ]
                                                                                  (fun Unit Ordering)
                                                                                }
                                                                                (lam
                                                                                  l
                                                                                  a
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                {
                                                                                                  Extended_match
                                                                                                  a
                                                                                                }
                                                                                                ds
                                                                                              ]
                                                                                              (fun Unit Ordering)
                                                                                            }
                                                                                            (lam
                                                                                              r
                                                                                              a
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      {
                                                                                                        compare
                                                                                                        a
                                                                                                      }
                                                                                                      dOrd
                                                                                                    ]
                                                                                                    l
                                                                                                  ]
                                                                                                  r
                                                                                                ]
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            [
                                                                                              fail
                                                                                              (abs
                                                                                                e
                                                                                                (type)
                                                                                                (error
                                                                                                  e
                                                                                                )
                                                                                              )
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            fail
                                                                                            (abs
                                                                                              e
                                                                                              (type)
                                                                                              (error
                                                                                                e
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                      Unit
                                                                                    ]
                                                                                  )
                                                                                )
                                                                              ]
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                [
                                                                                  fail
                                                                                  (abs
                                                                                    e
                                                                                    (type)
                                                                                    (error
                                                                                      e
                                                                                    )
                                                                                  )
                                                                                ]
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              GT
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      LT
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            )
                                                            [
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      [
                                                                        {
                                                                          Extended_match
                                                                          a
                                                                        }
                                                                        ds
                                                                      ]
                                                                      (fun Unit Ordering)
                                                                    }
                                                                    (lam
                                                                      default_arg0
                                                                      a
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          fail
                                                                          (abs
                                                                            e
                                                                            (type)
                                                                            (error
                                                                              e
                                                                            )
                                                                          )
                                                                        ]
                                                                      )
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      fail
                                                                      (abs
                                                                        e
                                                                        (type)
                                                                        (error e
                                                                        )
                                                                      )
                                                                    ]
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                Extended_match
                                                                                a
                                                                              }
                                                                              ds
                                                                            ]
                                                                            (fun Unit Ordering)
                                                                          }
                                                                          (lam
                                                                            default_arg0
                                                                            a
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                fail
                                                                                (abs
                                                                                  e
                                                                                  (type)
                                                                                  (error
                                                                                    e
                                                                                  )
                                                                                )
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            fail
                                                                            (abs
                                                                              e
                                                                              (type)
                                                                              (error
                                                                                e
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        EQ
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                      )
                                                    ]
                                                    (lam thunk Unit GT)
                                                  ]
                                                  (lam
                                                    thunk
                                                    Unit
                                                    (let
                                                      (nonrec)
                                                      (termbind
                                                        (strict)
                                                        (vardecl
                                                          fail
                                                          (fun (all a (type) a) Ordering)
                                                        )
                                                        (lam
                                                          ds
                                                          (all a (type) a)
                                                          [
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      {
                                                                        Extended_match
                                                                        a
                                                                      }
                                                                      ds
                                                                    ]
                                                                    (fun Unit Ordering)
                                                                  }
                                                                  (lam
                                                                    default_arg0
                                                                    a
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        [
                                                                          [
                                                                            [
                                                                              {
                                                                                [
                                                                                  {
                                                                                    Extended_match
                                                                                    a
                                                                                  }
                                                                                  ds
                                                                                ]
                                                                                (fun Unit Ordering)
                                                                              }
                                                                              (lam
                                                                                l
                                                                                a
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  [
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              {
                                                                                                Extended_match
                                                                                                a
                                                                                              }
                                                                                              ds
                                                                                            ]
                                                                                            (fun Unit Ordering)
                                                                                          }
                                                                                          (lam
                                                                                            r
                                                                                            a
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              [
                                                                                                [
                                                                                                  [
                                                                                                    {
                                                                                                      compare
                                                                                                      a
                                                                                                    }
                                                                                                    dOrd
                                                                                                  ]
                                                                                                  l
                                                                                                ]
                                                                                                r
                                                                                              ]
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            fail
                                                                                            (abs
                                                                                              e
                                                                                              (type)
                                                                                              (error
                                                                                                e
                                                                                              )
                                                                                            )
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          fail
                                                                                          (abs
                                                                                            e
                                                                                            (type)
                                                                                            (error
                                                                                              e
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    Unit
                                                                                  ]
                                                                                )
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                fail
                                                                                (abs
                                                                                  e
                                                                                  (type)
                                                                                  (error
                                                                                    e
                                                                                  )
                                                                                )
                                                                              ]
                                                                            )
                                                                          ]
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            GT
                                                                          )
                                                                        ]
                                                                        Unit
                                                                      ]
                                                                    )
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                Extended_match
                                                                                a
                                                                              }
                                                                              ds
                                                                            ]
                                                                            (fun Unit Ordering)
                                                                          }
                                                                          (lam
                                                                            l
                                                                            a
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          {
                                                                                            Extended_match
                                                                                            a
                                                                                          }
                                                                                          ds
                                                                                        ]
                                                                                        (fun Unit Ordering)
                                                                                      }
                                                                                      (lam
                                                                                        r
                                                                                        a
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  compare
                                                                                                  a
                                                                                                }
                                                                                                dOrd
                                                                                              ]
                                                                                              l
                                                                                            ]
                                                                                            r
                                                                                          ]
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      [
                                                                                        fail
                                                                                        (abs
                                                                                          e
                                                                                          (type)
                                                                                          (error
                                                                                            e
                                                                                          )
                                                                                        )
                                                                                      ]
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      fail
                                                                                      (abs
                                                                                        e
                                                                                        (type)
                                                                                        (error
                                                                                          e
                                                                                        )
                                                                                      )
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                Unit
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            fail
                                                                            (abs
                                                                              e
                                                                              (type)
                                                                              (error
                                                                                e
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        GT
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                              ]
                                                              (lam thunk Unit LT
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      )
                                                      [
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  {
                                                                    Extended_match
                                                                    a
                                                                  }
                                                                  ds
                                                                ]
                                                                (fun Unit Ordering)
                                                              }
                                                              (lam
                                                                default_arg0
                                                                a
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    fail
                                                                    (abs
                                                                      e
                                                                      (type)
                                                                      (error e)
                                                                    )
                                                                  ]
                                                                )
                                                              )
                                                            ]
                                                            (lam
                                                              thunk
                                                              Unit
                                                              [
                                                                fail
                                                                (abs
                                                                  e
                                                                  (type)
                                                                  (error e)
                                                                )
                                                              ]
                                                            )
                                                          ]
                                                          (lam
                                                            thunk
                                                            Unit
                                                            [
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      [
                                                                        {
                                                                          Extended_match
                                                                          a
                                                                        }
                                                                        ds
                                                                      ]
                                                                      (fun Unit Ordering)
                                                                    }
                                                                    (lam
                                                                      default_arg0
                                                                      a
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          fail
                                                                          (abs
                                                                            e
                                                                            (type)
                                                                            (error
                                                                              e
                                                                            )
                                                                          )
                                                                        ]
                                                                      )
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      fail
                                                                      (abs
                                                                        e
                                                                        (type)
                                                                        (error e
                                                                        )
                                                                      )
                                                                    ]
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk Unit EQ
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        ]
                                                        Unit
                                                      ]
                                                    )
                                                  )
                                                ]
                                                Unit
                                              ]
                                            )
                                          ]
                                          Unit
                                        ]
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                fOrdUpperBound0_c
                                (all a (type) (fun [Ord a] (fun [UpperBound a] (fun [UpperBound a] Bool))))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  dOrd
                                  [Ord a]
                                  (lam
                                    x
                                    [UpperBound a]
                                    (lam
                                      y
                                      [UpperBound a]
                                      [
                                        { [ { UpperBound_match a } x ] Bool }
                                        (lam
                                          v
                                          [Extended a]
                                          (lam
                                            in
                                            Bool
                                            [
                                              {
                                                [ { UpperBound_match a } y ]
                                                Bool
                                              }
                                              (lam
                                                v
                                                [Extended a]
                                                (lam
                                                  in
                                                  Bool
                                                  [
                                                    [
                                                      [
                                                        [
                                                          {
                                                            [
                                                              Ordering_match
                                                              [
                                                                [
                                                                  [
                                                                    {
                                                                      hull_ccompare
                                                                      a
                                                                    }
                                                                    dOrd
                                                                  ]
                                                                  v
                                                                ]
                                                                v
                                                              ]
                                                            ]
                                                            (fun Unit Bool)
                                                          }
                                                          (lam
                                                            thunk
                                                            Unit
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      Bool_match
                                                                      in
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    in
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  True
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        ]
                                                        (lam thunk Unit False)
                                                      ]
                                                      (lam thunk Unit True)
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              )
                                            ]
                                          )
                                        )
                                      ]
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                contains
                                (all a (type) (fun [Ord a] (fun [Interval a] (fun [Interval a] Bool))))
                              )
                              (abs
                                a
                                (type)
                                (lam
                                  dOrd
                                  [Ord a]
                                  (lam
                                    ds
                                    [Interval a]
                                    (lam
                                      ds
                                      [Interval a]
                                      [
                                        { [ { Interval_match a } ds ] Bool }
                                        (lam
                                          l
                                          [LowerBound a]
                                          (lam
                                            h
                                            [UpperBound a]
                                            [
                                              {
                                                [ { Interval_match a } ds ] Bool
                                              }
                                              (lam
                                                l
                                                [LowerBound a]
                                                (lam
                                                  h
                                                  [UpperBound a]
                                                  [
                                                    {
                                                      [
                                                        { LowerBound_match a } l
                                                      ]
                                                      Bool
                                                    }
                                                    (lam
                                                      v
                                                      [Extended a]
                                                      (lam
                                                        in
                                                        Bool
                                                        [
                                                          {
                                                            [
                                                              {
                                                                LowerBound_match
                                                                a
                                                              }
                                                              l
                                                            ]
                                                            Bool
                                                          }
                                                          (lam
                                                            v
                                                            [Extended a]
                                                            (lam
                                                              in
                                                              Bool
                                                              [
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          Ordering_match
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  hull_ccompare
                                                                                  a
                                                                                }
                                                                                dOrd
                                                                              ]
                                                                              v
                                                                            ]
                                                                            v
                                                                          ]
                                                                        ]
                                                                        (fun Unit Bool)
                                                                      }
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          [
                                                                            [
                                                                              {
                                                                                [
                                                                                  Bool_match
                                                                                  in
                                                                                ]
                                                                                (fun Unit Bool)
                                                                              }
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          Bool_match
                                                                                          in
                                                                                        ]
                                                                                        (fun Unit Bool)
                                                                                      }
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              {
                                                                                                fOrdUpperBound0_c
                                                                                                a
                                                                                              }
                                                                                              dOrd
                                                                                            ]
                                                                                            h
                                                                                          ]
                                                                                          h
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      False
                                                                                    )
                                                                                  ]
                                                                                  Unit
                                                                                ]
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      fOrdUpperBound0_c
                                                                                      a
                                                                                    }
                                                                                    dOrd
                                                                                  ]
                                                                                  h
                                                                                ]
                                                                                h
                                                                              ]
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      False
                                                                    )
                                                                  ]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            fOrdUpperBound0_c
                                                                            a
                                                                          }
                                                                          dOrd
                                                                        ]
                                                                        h
                                                                      ]
                                                                      h
                                                                    ]
                                                                  )
                                                                ]
                                                                Unit
                                                              ]
                                                            )
                                                          )
                                                        ]
                                                      )
                                                    )
                                                  ]
                                                )
                                              )
                                            ]
                                          )
                                        )
                                      ]
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                findDatum
                                (fun (con bytestring) (fun TxInfo [Maybe Data]))
                              )
                              (lam
                                dsh
                                (con bytestring)
                                (lam
                                  ds
                                  TxInfo
                                  [
                                    { [ TxInfo_match ds ] [Maybe Data] }
                                    (lam
                                      ds
                                      [List TxInInfo]
                                      (lam
                                        ds
                                        [List TxInInfo]
                                        (lam
                                          ds
                                          [List TxOut]
                                          (lam
                                            ds
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              ds
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                              (lam
                                                ds
                                                [List DCert]
                                                (lam
                                                  ds
                                                  [List [[Tuple2 StakingCredential] (con integer)]]
                                                  (lam
                                                    ds
                                                    [Interval (con integer)]
                                                    (lam
                                                      ds
                                                      [List (con bytestring)]
                                                      (lam
                                                        ds
                                                        [List [[Tuple2 (con bytestring)] Data]]
                                                        (lam
                                                          ds
                                                          (con bytestring)
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  [
                                                                    {
                                                                      Maybe_match
                                                                      [[Tuple2 (con bytestring)] Data]
                                                                    }
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            {
                                                                              fFoldableNil_cfoldMap
                                                                              [(lam a (type) [Maybe a]) [[Tuple2 (con bytestring)] Data]]
                                                                            }
                                                                            [[Tuple2 (con bytestring)] Data]
                                                                          }
                                                                          {
                                                                            fMonoidFirst
                                                                            [[Tuple2 (con bytestring)] Data]
                                                                          }
                                                                        ]
                                                                        (lam
                                                                          x
                                                                          [[Tuple2 (con bytestring)] Data]
                                                                          [
                                                                            {
                                                                              [
                                                                                {
                                                                                  {
                                                                                    Tuple2_match
                                                                                    (con bytestring)
                                                                                  }
                                                                                  Data
                                                                                }
                                                                                x
                                                                              ]
                                                                              [Maybe [[Tuple2 (con bytestring)] Data]]
                                                                            }
                                                                            (lam
                                                                              dsh
                                                                              (con bytestring)
                                                                              (lam
                                                                                ds
                                                                                Data
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          Bool_match
                                                                                          [
                                                                                            [
                                                                                              equalsByteString
                                                                                              dsh
                                                                                            ]
                                                                                            dsh
                                                                                          ]
                                                                                        ]
                                                                                        (fun Unit [Maybe [[Tuple2 (con bytestring)] Data]])
                                                                                      }
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          {
                                                                                            Just
                                                                                            [[Tuple2 (con bytestring)] Data]
                                                                                          }
                                                                                          x
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      {
                                                                                        Nothing
                                                                                        [[Tuple2 (con bytestring)] Data]
                                                                                      }
                                                                                    )
                                                                                  ]
                                                                                  Unit
                                                                                ]
                                                                              )
                                                                            )
                                                                          ]
                                                                        )
                                                                      ]
                                                                      ds
                                                                    ]
                                                                  ]
                                                                  (fun Unit [Maybe Data])
                                                                }
                                                                (lam
                                                                  a
                                                                  [[Tuple2 (con bytestring)] Data]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      {
                                                                        Just
                                                                        Data
                                                                      }
                                                                      [
                                                                        {
                                                                          [
                                                                            {
                                                                              {
                                                                                Tuple2_match
                                                                                (con bytestring)
                                                                              }
                                                                              Data
                                                                            }
                                                                            a
                                                                          ]
                                                                          Data
                                                                        }
                                                                        (lam
                                                                          ds
                                                                          (con bytestring)
                                                                          (lam
                                                                            b
                                                                            Data
                                                                            b
                                                                          )
                                                                        )
                                                                      ]
                                                                    ]
                                                                  )
                                                                )
                                                              ]
                                                              (lam
                                                                thunk
                                                                Unit
                                                                { Nothing Data }
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                findTxInByTxOutRef
                                (fun TxOutRef (fun TxInfo [Maybe TxInInfo]))
                              )
                              (lam
                                outRef
                                TxOutRef
                                (lam
                                  ds
                                  TxInfo
                                  [
                                    { [ TxInfo_match ds ] [Maybe TxInInfo] }
                                    (lam
                                      ds
                                      [List TxInInfo]
                                      (lam
                                        ds
                                        [List TxInInfo]
                                        (lam
                                          ds
                                          [List TxOut]
                                          (lam
                                            ds
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              ds
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                              (lam
                                                ds
                                                [List DCert]
                                                (lam
                                                  ds
                                                  [List [[Tuple2 StakingCredential] (con integer)]]
                                                  (lam
                                                    ds
                                                    [Interval (con integer)]
                                                    (lam
                                                      ds
                                                      [List (con bytestring)]
                                                      (lam
                                                        ds
                                                        [List [[Tuple2 (con bytestring)] Data]]
                                                        (lam
                                                          ds
                                                          (con bytestring)
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  [
                                                                    {
                                                                      Nil_match
                                                                      TxInInfo
                                                                    }
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            {
                                                                              foldr
                                                                              TxInInfo
                                                                            }
                                                                            [List TxInInfo]
                                                                          }
                                                                          (lam
                                                                            e
                                                                            TxInInfo
                                                                            (lam
                                                                              xs
                                                                              [List TxInInfo]
                                                                              [
                                                                                {
                                                                                  [
                                                                                    TxInInfo_match
                                                                                    e
                                                                                  ]
                                                                                  [List TxInInfo]
                                                                                }
                                                                                (lam
                                                                                  ds
                                                                                  TxOutRef
                                                                                  (lam
                                                                                    ds
                                                                                    TxOut
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              Bool_match
                                                                                              [
                                                                                                [
                                                                                                  fEqTxOutRef_c
                                                                                                  ds
                                                                                                ]
                                                                                                outRef
                                                                                              ]
                                                                                            ]
                                                                                            (fun Unit [List TxInInfo])
                                                                                          }
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  Cons
                                                                                                  TxInInfo
                                                                                                }
                                                                                                e
                                                                                              ]
                                                                                              xs
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          xs
                                                                                        )
                                                                                      ]
                                                                                      Unit
                                                                                    ]
                                                                                  )
                                                                                )
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                        {
                                                                          Nil
                                                                          TxInInfo
                                                                        }
                                                                      ]
                                                                      ds
                                                                    ]
                                                                  ]
                                                                  (fun Unit [Maybe TxInInfo])
                                                                }
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  {
                                                                    Nothing
                                                                    TxInInfo
                                                                  }
                                                                )
                                                              ]
                                                              (lam
                                                                x
                                                                TxInInfo
                                                                (lam
                                                                  ds
                                                                  [List TxInInfo]
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [
                                                                      {
                                                                        Just
                                                                        TxInInfo
                                                                      }
                                                                      x
                                                                    ]
                                                                  )
                                                                )
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                snd
                                (all a (type) (all b (type) (fun [[Tuple2 a] b] b)))
                              )
                              (abs
                                a
                                (type)
                                (abs
                                  b
                                  (type)
                                  (lam
                                    ds
                                    [[Tuple2 a] b]
                                    [
                                      { [ { { Tuple2_match a } b } ds ] b }
                                      (lam ds a (lam b b b))
                                    ]
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                txSignedBy
                                (fun TxInfo (fun (con bytestring) Bool))
                              )
                              (lam
                                ds
                                TxInfo
                                (lam
                                  k
                                  (con bytestring)
                                  [
                                    { [ TxInfo_match ds ] Bool }
                                    (lam
                                      ds
                                      [List TxInInfo]
                                      (lam
                                        ds
                                        [List TxInInfo]
                                        (lam
                                          ds
                                          [List TxOut]
                                          (lam
                                            ds
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              ds
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                              (lam
                                                ds
                                                [List DCert]
                                                (lam
                                                  ds
                                                  [List [[Tuple2 StakingCredential] (con integer)]]
                                                  (lam
                                                    ds
                                                    [Interval (con integer)]
                                                    (lam
                                                      ds
                                                      [List (con bytestring)]
                                                      (lam
                                                        ds
                                                        [List [[Tuple2 (con bytestring)] Data]]
                                                        (lam
                                                          ds
                                                          (con bytestring)
                                                          (let
                                                            (nonrec)
                                                            (termbind
                                                              (nonstrict)
                                                              (vardecl
                                                                p
                                                                (fun (con bytestring) Bool)
                                                              )
                                                              [
                                                                equalsByteString
                                                                k
                                                              ]
                                                            )
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      {
                                                                        Maybe_match
                                                                        (con bytestring)
                                                                      }
                                                                      [
                                                                        [
                                                                          [
                                                                            {
                                                                              {
                                                                                fFoldableNil_cfoldMap
                                                                                [(lam a (type) [Maybe a]) (con bytestring)]
                                                                              }
                                                                              (con bytestring)
                                                                            }
                                                                            {
                                                                              fMonoidFirst
                                                                              (con bytestring)
                                                                            }
                                                                          ]
                                                                          (lam
                                                                            x
                                                                            (con bytestring)
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      Bool_match
                                                                                      [
                                                                                        p
                                                                                        x
                                                                                      ]
                                                                                    ]
                                                                                    (fun Unit [Maybe (con bytestring)])
                                                                                  }
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      {
                                                                                        Just
                                                                                        (con bytestring)
                                                                                      }
                                                                                      x
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  {
                                                                                    Nothing
                                                                                    (con bytestring)
                                                                                  }
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        ]
                                                                        ds
                                                                      ]
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    ds
                                                                    (con bytestring)
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      True
                                                                    )
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  False
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                valueOf
                                (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun (con bytestring) (fun (con bytestring) (con integer))))
                              )
                              (lam
                                ds
                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                (lam
                                  cur
                                  (con bytestring)
                                  (lam
                                    tn
                                    (con bytestring)
                                    (let
                                      (nonrec)
                                      (termbind
                                        (strict)
                                        (vardecl
                                          j
                                          (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)] (con integer))
                                        )
                                        (lam
                                          i
                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                          (let
                                            (rec)
                                            (termbind
                                              (strict)
                                              (vardecl
                                                go
                                                (fun [List [[Tuple2 (con bytestring)] (con integer)]] (con integer))
                                              )
                                              (lam
                                                ds
                                                [List [[Tuple2 (con bytestring)] (con integer)]]
                                                [
                                                  [
                                                    {
                                                      [
                                                        {
                                                          Nil_match
                                                          [[Tuple2 (con bytestring)] (con integer)]
                                                        }
                                                        ds
                                                      ]
                                                      (con integer)
                                                    }
                                                    (con integer 0)
                                                  ]
                                                  (lam
                                                    ds
                                                    [[Tuple2 (con bytestring)] (con integer)]
                                                    (lam
                                                      xs
                                                      [List [[Tuple2 (con bytestring)] (con integer)]]
                                                      [
                                                        {
                                                          [
                                                            {
                                                              {
                                                                Tuple2_match
                                                                (con bytestring)
                                                              }
                                                              (con integer)
                                                            }
                                                            ds
                                                          ]
                                                          (con integer)
                                                        }
                                                        (lam
                                                          c
                                                          (con bytestring)
                                                          (lam
                                                            i
                                                            (con integer)
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      Bool_match
                                                                      [
                                                                        [
                                                                          equalsByteString
                                                                          c
                                                                        ]
                                                                        tn
                                                                      ]
                                                                    ]
                                                                    (fun Unit (con integer))
                                                                  }
                                                                  (lam
                                                                    thunk Unit i
                                                                  )
                                                                ]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [ go xs ]
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                      ]
                                                    )
                                                  )
                                                ]
                                              )
                                            )
                                            [ go i ]
                                          )
                                        )
                                      )
                                      (let
                                        (rec)
                                        (termbind
                                          (strict)
                                          (vardecl
                                            go
                                            (fun [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]] (con integer))
                                          )
                                          (lam
                                            ds
                                            [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                            [
                                              [
                                                {
                                                  [
                                                    {
                                                      Nil_match
                                                      [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                    }
                                                    ds
                                                  ]
                                                  (con integer)
                                                }
                                                (con integer 0)
                                              ]
                                              (lam
                                                ds
                                                [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                (lam
                                                  xs
                                                  [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                  [
                                                    {
                                                      [
                                                        {
                                                          {
                                                            Tuple2_match
                                                            (con bytestring)
                                                          }
                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                        }
                                                        ds
                                                      ]
                                                      (con integer)
                                                    }
                                                    (lam
                                                      c
                                                      (con bytestring)
                                                      (lam
                                                        i
                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  Bool_match
                                                                  [
                                                                    [
                                                                      equalsByteString
                                                                      c
                                                                    ]
                                                                    cur
                                                                  ]
                                                                ]
                                                                (fun Unit (con integer))
                                                              }
                                                              (lam
                                                                thunk
                                                                Unit
                                                                [ j i ]
                                                              )
                                                            ]
                                                            (lam
                                                              thunk
                                                              Unit
                                                              [ go xs ]
                                                            )
                                                          ]
                                                          Unit
                                                        ]
                                                      )
                                                    )
                                                  ]
                                                )
                                              )
                                            ]
                                          )
                                        )
                                        [ go ds ]
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                foldr
                                (all a (type) (all b (type) (fun (fun a (fun b b)) (fun b (fun [List a] b)))))
                              )
                              (abs
                                a
                                (type)
                                (abs
                                  b
                                  (type)
                                  (lam
                                    k
                                    (fun a (fun b b))
                                    (lam
                                      z
                                      b
                                      (let
                                        (rec)
                                        (termbind
                                          (strict)
                                          (vardecl go (fun [List a] b))
                                          (lam
                                            ds
                                            [List a]
                                            [
                                              [
                                                [
                                                  {
                                                    [ { Nil_match a } ds ]
                                                    (fun Unit b)
                                                  }
                                                  (lam thunk Unit z)
                                                ]
                                                (lam
                                                  y
                                                  a
                                                  (lam
                                                    ys
                                                    [List a]
                                                    (lam
                                                      thunk
                                                      Unit
                                                      [ [ k y ] [ go ys ] ]
                                                    )
                                                  )
                                                )
                                              ]
                                              Unit
                                            ]
                                          )
                                        )
                                        go
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                pubKeyOutputsAt
                                (fun (con bytestring) (fun TxInfo [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]))
                              )
                              (lam
                                pk
                                (con bytestring)
                                (lam
                                  p
                                  TxInfo
                                  [
                                    {
                                      [ TxInfo_match p ]
                                      [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                    }
                                    (lam
                                      ds
                                      [List TxInInfo]
                                      (lam
                                        ds
                                        [List TxInInfo]
                                        (lam
                                          ds
                                          [List TxOut]
                                          (lam
                                            ds
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              ds
                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                              (lam
                                                ds
                                                [List DCert]
                                                (lam
                                                  ds
                                                  [List [[Tuple2 StakingCredential] (con integer)]]
                                                  (lam
                                                    ds
                                                    [Interval (con integer)]
                                                    (lam
                                                      ds
                                                      [List (con bytestring)]
                                                      (lam
                                                        ds
                                                        [List [[Tuple2 (con bytestring)] Data]]
                                                        (lam
                                                          ds
                                                          (con bytestring)
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  {
                                                                    foldr TxOut
                                                                  }
                                                                  [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                                }
                                                                (lam
                                                                  e
                                                                  TxOut
                                                                  (lam
                                                                    xs
                                                                    [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                                    [
                                                                      {
                                                                        [
                                                                          TxOut_match
                                                                          e
                                                                        ]
                                                                        [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                                      }
                                                                      (lam
                                                                        ds
                                                                        Address
                                                                        (lam
                                                                          ds
                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                          (lam
                                                                            ds
                                                                            [Maybe (con bytestring)]
                                                                            [
                                                                              {
                                                                                [
                                                                                  Address_match
                                                                                  ds
                                                                                ]
                                                                                [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                                              }
                                                                              (lam
                                                                                ds
                                                                                Credential
                                                                                (lam
                                                                                  ds
                                                                                  [Maybe StakingCredential]
                                                                                  [
                                                                                    [
                                                                                      {
                                                                                        [
                                                                                          Credential_match
                                                                                          ds
                                                                                        ]
                                                                                        [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                                                                      }
                                                                                      (lam
                                                                                        pk
                                                                                        (con bytestring)
                                                                                        [
                                                                                          [
                                                                                            [
                                                                                              {
                                                                                                [
                                                                                                  Bool_match
                                                                                                  [
                                                                                                    [
                                                                                                      equalsByteString
                                                                                                      pk
                                                                                                    ]
                                                                                                    pk
                                                                                                  ]
                                                                                                ]
                                                                                                (fun Unit [List [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]])
                                                                                              }
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                [
                                                                                                  [
                                                                                                    {
                                                                                                      Cons
                                                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                    }
                                                                                                    ds
                                                                                                  ]
                                                                                                  xs
                                                                                                ]
                                                                                              )
                                                                                            ]
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              xs
                                                                                            )
                                                                                          ]
                                                                                          Unit
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    (lam
                                                                                      ipv
                                                                                      (con bytestring)
                                                                                      xs
                                                                                    )
                                                                                  ]
                                                                                )
                                                                              )
                                                                            ]
                                                                          )
                                                                        )
                                                                      )
                                                                    ]
                                                                  )
                                                                )
                                                              ]
                                                              {
                                                                Nil
                                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                              }
                                                            ]
                                                            ds
                                                          ]
                                                        )
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  ]
                                )
                              )
                            )
                            (termbind
                              (nonstrict)
                              (vardecl
                                fMonoidValue_c
                                (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]))
                              )
                              [ unionWith (builtin addInteger) ]
                            )
                            (termbind
                              (strict)
                              (vardecl
                                valuePaidTo
                                (fun TxInfo (fun (con bytestring) [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]))
                              )
                              (lam
                                ptx
                                TxInfo
                                (lam
                                  pkh
                                  (con bytestring)
                                  [
                                    [
                                      [
                                        {
                                          {
                                            foldr
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                          }
                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                        }
                                        fMonoidValue_c
                                      ]
                                      {
                                        Nil
                                        [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                      }
                                    ]
                                    [ [ pubKeyOutputsAt pkh ] ptx ]
                                  ]
                                )
                              )
                            )
                            (termbind
                              (nonstrict)
                              (vardecl
                                fMonoidValue
                                [Monoid [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                              )
                              [
                                [
                                  {
                                    CConsMonoid
                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                  }
                                  fMonoidValue_c
                                ]
                                {
                                  Nil
                                  [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                }
                              ]
                            )
                            (termbind
                              (strict)
                              (vardecl
                                txOutValue
                                (fun TxOut [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]])
                              )
                              (lam
                                ds
                                TxOut
                                [
                                  {
                                    [ TxOut_match ds ]
                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                  }
                                  (lam
                                    ds
                                    Address
                                    (lam
                                      ds
                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                      (lam ds [Maybe (con bytestring)] ds)
                                    )
                                  )
                                ]
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                valueProduced
                                (fun TxInfo [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]])
                              )
                              (lam
                                x
                                TxInfo
                                [
                                  {
                                    [ TxInfo_match x ]
                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                  }
                                  (lam
                                    ds
                                    [List TxInInfo]
                                    (lam
                                      ds
                                      [List TxInInfo]
                                      (lam
                                        ds
                                        [List TxOut]
                                        (lam
                                          ds
                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                          (lam
                                            ds
                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              ds
                                              [List DCert]
                                              (lam
                                                ds
                                                [List [[Tuple2 StakingCredential] (con integer)]]
                                                (lam
                                                  ds
                                                  [Interval (con integer)]
                                                  (lam
                                                    ds
                                                    [List (con bytestring)]
                                                    (lam
                                                      ds
                                                      [List [[Tuple2 (con bytestring)] Data]]
                                                      (lam
                                                        ds
                                                        (con bytestring)
                                                        [
                                                          [
                                                            [
                                                              {
                                                                {
                                                                  fFoldableNil_cfoldMap
                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                }
                                                                TxOut
                                                              }
                                                              fMonoidValue
                                                            ]
                                                            txOutValue
                                                          ]
                                                          ds
                                                        ]
                                                      )
                                                    )
                                                  )
                                                )
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  )
                                ]
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                checkTxConstraint
                                (fun ScriptContext (fun TxConstraint Bool))
                              )
                              (lam
                                ds
                                ScriptContext
                                [
                                  {
                                    [ ScriptContext_match ds ]
                                    (fun TxConstraint Bool)
                                  }
                                  (lam
                                    ds
                                    TxInfo
                                    (lam
                                      ds
                                      ScriptPurpose
                                      (lam
                                        ds
                                        TxConstraint
                                        [
                                          [
                                            [
                                              [
                                                [
                                                  [
                                                    [
                                                      [
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  TxConstraint_match
                                                                  ds
                                                                ]
                                                                Bool
                                                              }
                                                              (lam
                                                                pubKey
                                                                (con bytestring)
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          Bool_match
                                                                          [
                                                                            [
                                                                              txSignedBy
                                                                              ds
                                                                            ]
                                                                            pubKey
                                                                          ]
                                                                        ]
                                                                        (fun Unit Bool)
                                                                      }
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        True
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        [
                                                                          {
                                                                            [
                                                                              Unit_match
                                                                              [
                                                                                trace
                                                                                (con
                                                                                  string
                                                                                    "Missing signature"
                                                                                )
                                                                              ]
                                                                            ]
                                                                            (fun Unit Bool)
                                                                          }
                                                                          (lam
                                                                            thunk
                                                                            Unit
                                                                            False
                                                                          )
                                                                        ]
                                                                        Unit
                                                                      ]
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            ]
                                                            (lam
                                                              mps
                                                              (con bytestring)
                                                              (lam
                                                                tn
                                                                (con bytestring)
                                                                (lam
                                                                  v
                                                                  (con integer)
                                                                  [
                                                                    [
                                                                      [
                                                                        {
                                                                          [
                                                                            Bool_match
                                                                            [
                                                                              [
                                                                                equalsInteger
                                                                                [
                                                                                  [
                                                                                    [
                                                                                      valueOf
                                                                                      [
                                                                                        {
                                                                                          [
                                                                                            TxInfo_match
                                                                                            ds
                                                                                          ]
                                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                        }
                                                                                        (lam
                                                                                          ds
                                                                                          [List TxInInfo]
                                                                                          (lam
                                                                                            ds
                                                                                            [List TxInInfo]
                                                                                            (lam
                                                                                              ds
                                                                                              [List TxOut]
                                                                                              (lam
                                                                                                ds
                                                                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                (lam
                                                                                                  ds
                                                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                  (lam
                                                                                                    ds
                                                                                                    [List DCert]
                                                                                                    (lam
                                                                                                      ds
                                                                                                      [List [[Tuple2 StakingCredential] (con integer)]]
                                                                                                      (lam
                                                                                                        ds
                                                                                                        [Interval (con integer)]
                                                                                                        (lam
                                                                                                          ds
                                                                                                          [List (con bytestring)]
                                                                                                          (lam
                                                                                                            ds
                                                                                                            [List [[Tuple2 (con bytestring)] Data]]
                                                                                                            (lam
                                                                                                              ds
                                                                                                              (con bytestring)
                                                                                                              ds
                                                                                                            )
                                                                                                          )
                                                                                                        )
                                                                                                      )
                                                                                                    )
                                                                                                  )
                                                                                                )
                                                                                              )
                                                                                            )
                                                                                          )
                                                                                        )
                                                                                      ]
                                                                                    ]
                                                                                    mps
                                                                                  ]
                                                                                  tn
                                                                                ]
                                                                              ]
                                                                              v
                                                                            ]
                                                                          ]
                                                                          (fun Unit Bool)
                                                                        }
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          True
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        [
                                                                          [
                                                                            {
                                                                              [
                                                                                Unit_match
                                                                                [
                                                                                  trace
                                                                                  (con
                                                                                    string
                                                                                      "Value forged not OK"
                                                                                  )
                                                                                ]
                                                                              ]
                                                                              (fun Unit Bool)
                                                                            }
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              False
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                              )
                                                            )
                                                          ]
                                                          (lam
                                                            dvh
                                                            (con bytestring)
                                                            (lam
                                                              dv
                                                              Data
                                                              (let
                                                                (nonrec)
                                                                (termbind
                                                                  (nonstrict)
                                                                  (vardecl
                                                                    j Bool
                                                                  )
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          Unit_match
                                                                          [
                                                                            trace
                                                                            (con
                                                                              string
                                                                                "MustHashDatum"
                                                                            )
                                                                          ]
                                                                        ]
                                                                        (fun Unit Bool)
                                                                      }
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        False
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                                [
                                                                  [
                                                                    [
                                                                      {
                                                                        [
                                                                          {
                                                                            Maybe_match
                                                                            Data
                                                                          }
                                                                          [
                                                                            [
                                                                              findDatum
                                                                              dvh
                                                                            ]
                                                                            ds
                                                                          ]
                                                                        ]
                                                                        (fun Unit Bool)
                                                                      }
                                                                      (lam
                                                                        a
                                                                        Data
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  [
                                                                                    Bool_match
                                                                                    [
                                                                                      [
                                                                                        fEqData_c
                                                                                        a
                                                                                      ]
                                                                                      dv
                                                                                    ]
                                                                                  ]
                                                                                  (fun Unit Bool)
                                                                                }
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  True
                                                                                )
                                                                              ]
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                j
                                                                              )
                                                                            ]
                                                                            Unit
                                                                          ]
                                                                        )
                                                                      )
                                                                    ]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      j
                                                                    )
                                                                  ]
                                                                  Unit
                                                                ]
                                                              )
                                                            )
                                                          )
                                                        ]
                                                        (lam
                                                          dv
                                                          Data
                                                          [
                                                            {
                                                              [
                                                                TxInfo_match ds
                                                              ]
                                                              Bool
                                                            }
                                                            (lam
                                                              ds
                                                              [List TxInInfo]
                                                              (lam
                                                                ds
                                                                [List TxInInfo]
                                                                (lam
                                                                  ds
                                                                  [List TxOut]
                                                                  (lam
                                                                    ds
                                                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                    (lam
                                                                      ds
                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                      (lam
                                                                        ds
                                                                        [List DCert]
                                                                        (lam
                                                                          ds
                                                                          [List [[Tuple2 StakingCredential] (con integer)]]
                                                                          (lam
                                                                            ds
                                                                            [Interval (con integer)]
                                                                            (lam
                                                                              ds
                                                                              [List (con bytestring)]
                                                                              (lam
                                                                                ds
                                                                                [List [[Tuple2 (con bytestring)] Data]]
                                                                                (lam
                                                                                  ds
                                                                                  (con bytestring)
                                                                                  [
                                                                                    [
                                                                                      [
                                                                                        {
                                                                                          [
                                                                                            Bool_match
                                                                                            [
                                                                                              [
                                                                                                [
                                                                                                  {
                                                                                                    {
                                                                                                      fFoldableNil_cfoldMap
                                                                                                      [(lam a (type) a) Bool]
                                                                                                    }
                                                                                                    Data
                                                                                                  }
                                                                                                  [
                                                                                                    {
                                                                                                      fMonoidSum
                                                                                                      Bool
                                                                                                    }
                                                                                                    fAdditiveMonoidBool
                                                                                                  ]
                                                                                                ]
                                                                                                [
                                                                                                  fEqData_c
                                                                                                  dv
                                                                                                ]
                                                                                              ]
                                                                                              [
                                                                                                [
                                                                                                  {
                                                                                                    {
                                                                                                      fFunctorNil_cfmap
                                                                                                      [[Tuple2 (con bytestring)] Data]
                                                                                                    }
                                                                                                    Data
                                                                                                  }
                                                                                                  {
                                                                                                    {
                                                                                                      snd
                                                                                                      (con bytestring)
                                                                                                    }
                                                                                                    Data
                                                                                                  }
                                                                                                ]
                                                                                                ds
                                                                                              ]
                                                                                            ]
                                                                                          ]
                                                                                          (fun Unit Bool)
                                                                                        }
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          True
                                                                                        )
                                                                                      ]
                                                                                      (lam
                                                                                        thunk
                                                                                        Unit
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                Unit_match
                                                                                                [
                                                                                                  trace
                                                                                                  (con
                                                                                                    string
                                                                                                      "Missing datum"
                                                                                                  )
                                                                                                ]
                                                                                              ]
                                                                                              (fun Unit Bool)
                                                                                            }
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              False
                                                                                            )
                                                                                          ]
                                                                                          Unit
                                                                                        ]
                                                                                      )
                                                                                    ]
                                                                                    Unit
                                                                                  ]
                                                                                )
                                                                              )
                                                                            )
                                                                          )
                                                                        )
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              )
                                                            )
                                                          ]
                                                        )
                                                      ]
                                                      (lam
                                                        vlh
                                                        (con bytestring)
                                                        (lam
                                                          dv
                                                          Data
                                                          (lam
                                                            vl
                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                            (let
                                                              (nonrec)
                                                              (termbind
                                                                (nonstrict)
                                                                (vardecl
                                                                  hsh
                                                                  [Maybe (con bytestring)]
                                                                )
                                                                [
                                                                  [
                                                                    findDatumHash
                                                                    dv
                                                                  ]
                                                                  ds
                                                                ]
                                                              )
                                                              (termbind
                                                                (nonstrict)
                                                                (vardecl
                                                                  addr
                                                                  Credential
                                                                )
                                                                [
                                                                  ScriptCredential
                                                                  vlh
                                                                ]
                                                              )
                                                              (termbind
                                                                (nonstrict)
                                                                (vardecl
                                                                  addr Address
                                                                )
                                                                [
                                                                  [
                                                                    Address addr
                                                                  ]
                                                                  {
                                                                    Nothing
                                                                    StakingCredential
                                                                  }
                                                                ]
                                                              )
                                                              [
                                                                {
                                                                  [
                                                                    TxInfo_match
                                                                    ds
                                                                  ]
                                                                  Bool
                                                                }
                                                                (lam
                                                                  ds
                                                                  [List TxInInfo]
                                                                  (lam
                                                                    ds
                                                                    [List TxInInfo]
                                                                    (lam
                                                                      ds
                                                                      [List TxOut]
                                                                      (lam
                                                                        ds
                                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                        (lam
                                                                          ds
                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                          (lam
                                                                            ds
                                                                            [List DCert]
                                                                            (lam
                                                                              ds
                                                                              [List [[Tuple2 StakingCredential] (con integer)]]
                                                                              (lam
                                                                                ds
                                                                                [Interval (con integer)]
                                                                                (lam
                                                                                  ds
                                                                                  [List (con bytestring)]
                                                                                  (lam
                                                                                    ds
                                                                                    [List [[Tuple2 (con bytestring)] Data]]
                                                                                    (lam
                                                                                      ds
                                                                                      (con bytestring)
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                Bool_match
                                                                                                [
                                                                                                  [
                                                                                                    [
                                                                                                      {
                                                                                                        {
                                                                                                          fFoldableNil_cfoldMap
                                                                                                          [(lam a (type) a) Bool]
                                                                                                        }
                                                                                                        TxOut
                                                                                                      }
                                                                                                      [
                                                                                                        {
                                                                                                          fMonoidSum
                                                                                                          Bool
                                                                                                        }
                                                                                                        fAdditiveMonoidBool
                                                                                                      ]
                                                                                                    ]
                                                                                                    (lam
                                                                                                      ds
                                                                                                      TxOut
                                                                                                      [
                                                                                                        {
                                                                                                          [
                                                                                                            TxOut_match
                                                                                                            ds
                                                                                                          ]
                                                                                                          Bool
                                                                                                        }
                                                                                                        (lam
                                                                                                          ds
                                                                                                          Address
                                                                                                          (lam
                                                                                                            ds
                                                                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                            (lam
                                                                                                              ds
                                                                                                              [Maybe (con bytestring)]
                                                                                                              [
                                                                                                                [
                                                                                                                  [
                                                                                                                    {
                                                                                                                      [
                                                                                                                        {
                                                                                                                          Maybe_match
                                                                                                                          (con bytestring)
                                                                                                                        }
                                                                                                                        ds
                                                                                                                      ]
                                                                                                                      (fun Unit Bool)
                                                                                                                    }
                                                                                                                    (lam
                                                                                                                      svh
                                                                                                                      (con bytestring)
                                                                                                                      (lam
                                                                                                                        thunk
                                                                                                                        Unit
                                                                                                                        [
                                                                                                                          [
                                                                                                                            [
                                                                                                                              {
                                                                                                                                [
                                                                                                                                  Bool_match
                                                                                                                                  [
                                                                                                                                    [
                                                                                                                                      [
                                                                                                                                        checkBinRel
                                                                                                                                        equalsInteger
                                                                                                                                      ]
                                                                                                                                      ds
                                                                                                                                    ]
                                                                                                                                    vl
                                                                                                                                  ]
                                                                                                                                ]
                                                                                                                                (fun Unit Bool)
                                                                                                                              }
                                                                                                                              (lam
                                                                                                                                thunk
                                                                                                                                Unit
                                                                                                                                [
                                                                                                                                  [
                                                                                                                                    [
                                                                                                                                      {
                                                                                                                                        [
                                                                                                                                          {
                                                                                                                                            Maybe_match
                                                                                                                                            (con bytestring)
                                                                                                                                          }
                                                                                                                                          hsh
                                                                                                                                        ]
                                                                                                                                        (fun Unit Bool)
                                                                                                                                      }
                                                                                                                                      (lam
                                                                                                                                        a
                                                                                                                                        (con bytestring)
                                                                                                                                        (lam
                                                                                                                                          thunk
                                                                                                                                          Unit
                                                                                                                                          [
                                                                                                                                            [
                                                                                                                                              [
                                                                                                                                                {
                                                                                                                                                  [
                                                                                                                                                    Bool_match
                                                                                                                                                    [
                                                                                                                                                      [
                                                                                                                                                        equalsByteString
                                                                                                                                                        a
                                                                                                                                                      ]
                                                                                                                                                      svh
                                                                                                                                                    ]
                                                                                                                                                  ]
                                                                                                                                                  (fun Unit Bool)
                                                                                                                                                }
                                                                                                                                                (lam
                                                                                                                                                  thunk
                                                                                                                                                  Unit
                                                                                                                                                  [
                                                                                                                                                    [
                                                                                                                                                      fEqAddress_c
                                                                                                                                                      ds
                                                                                                                                                    ]
                                                                                                                                                    addr
                                                                                                                                                  ]
                                                                                                                                                )
                                                                                                                                              ]
                                                                                                                                              (lam
                                                                                                                                                thunk
                                                                                                                                                Unit
                                                                                                                                                False
                                                                                                                                              )
                                                                                                                                            ]
                                                                                                                                            Unit
                                                                                                                                          ]
                                                                                                                                        )
                                                                                                                                      )
                                                                                                                                    ]
                                                                                                                                    (lam
                                                                                                                                      thunk
                                                                                                                                      Unit
                                                                                                                                      False
                                                                                                                                    )
                                                                                                                                  ]
                                                                                                                                  Unit
                                                                                                                                ]
                                                                                                                              )
                                                                                                                            ]
                                                                                                                            (lam
                                                                                                                              thunk
                                                                                                                              Unit
                                                                                                                              False
                                                                                                                            )
                                                                                                                          ]
                                                                                                                          Unit
                                                                                                                        ]
                                                                                                                      )
                                                                                                                    )
                                                                                                                  ]
                                                                                                                  (lam
                                                                                                                    thunk
                                                                                                                    Unit
                                                                                                                    False
                                                                                                                  )
                                                                                                                ]
                                                                                                                Unit
                                                                                                              ]
                                                                                                            )
                                                                                                          )
                                                                                                        )
                                                                                                      ]
                                                                                                    )
                                                                                                  ]
                                                                                                  ds
                                                                                                ]
                                                                                              ]
                                                                                              (fun Unit Bool)
                                                                                            }
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              True
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  [
                                                                                                    Unit_match
                                                                                                    [
                                                                                                      trace
                                                                                                      (con
                                                                                                        string
                                                                                                          "MustPayToOtherScript"
                                                                                                      )
                                                                                                    ]
                                                                                                  ]
                                                                                                  (fun Unit Bool)
                                                                                                }
                                                                                                (lam
                                                                                                  thunk
                                                                                                  Unit
                                                                                                  False
                                                                                                )
                                                                                              ]
                                                                                              Unit
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        Unit
                                                                                      ]
                                                                                    )
                                                                                  )
                                                                                )
                                                                              )
                                                                            )
                                                                          )
                                                                        )
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              ]
                                                            )
                                                          )
                                                        )
                                                      )
                                                    ]
                                                    (lam
                                                      pk
                                                      (con bytestring)
                                                      (lam
                                                        vl
                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  Bool_match
                                                                  [
                                                                    [
                                                                      [
                                                                        checkBinRel
                                                                        lessThanEqInteger
                                                                      ]
                                                                      vl
                                                                    ]
                                                                    [
                                                                      [
                                                                        valuePaidTo
                                                                        ds
                                                                      ]
                                                                      pk
                                                                    ]
                                                                  ]
                                                                ]
                                                                (fun Unit Bool)
                                                              }
                                                              (lam
                                                                thunk Unit True
                                                              )
                                                            ]
                                                            (lam
                                                              thunk
                                                              Unit
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      Unit_match
                                                                      [
                                                                        trace
                                                                        (con
                                                                          string
                                                                            "MustPayToPubKey"
                                                                        )
                                                                      ]
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    False
                                                                  )
                                                                ]
                                                                Unit
                                                              ]
                                                            )
                                                          ]
                                                          Unit
                                                        ]
                                                      )
                                                    )
                                                  ]
                                                  (lam
                                                    vl
                                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                    [
                                                      [
                                                        [
                                                          {
                                                            [
                                                              Bool_match
                                                              [
                                                                [
                                                                  [
                                                                    checkBinRel
                                                                    lessThanEqInteger
                                                                  ]
                                                                  vl
                                                                ]
                                                                [
                                                                  valueProduced
                                                                  ds
                                                                ]
                                                              ]
                                                            ]
                                                            (fun Unit Bool)
                                                          }
                                                          (lam thunk Unit True)
                                                        ]
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  Unit_match
                                                                  [
                                                                    trace
                                                                    (con
                                                                      string
                                                                        "Produced value not OK"
                                                                    )
                                                                  ]
                                                                ]
                                                                (fun Unit Bool)
                                                              }
                                                              (lam
                                                                thunk Unit False
                                                              )
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      ]
                                                      Unit
                                                    ]
                                                  )
                                                ]
                                                (lam
                                                  vl
                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Bool_match
                                                            [
                                                              [
                                                                [
                                                                  checkBinRel
                                                                  lessThanEqInteger
                                                                ]
                                                                vl
                                                              ]
                                                              [
                                                                {
                                                                  [
                                                                    TxInfo_match
                                                                    ds
                                                                  ]
                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                }
                                                                (lam
                                                                  ds
                                                                  [List TxInInfo]
                                                                  (lam
                                                                    ds
                                                                    [List TxInInfo]
                                                                    (lam
                                                                      ds
                                                                      [List TxOut]
                                                                      (lam
                                                                        ds
                                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                        (lam
                                                                          ds
                                                                          [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                          (lam
                                                                            ds
                                                                            [List DCert]
                                                                            (lam
                                                                              ds
                                                                              [List [[Tuple2 StakingCredential] (con integer)]]
                                                                              (lam
                                                                                ds
                                                                                [Interval (con integer)]
                                                                                (lam
                                                                                  ds
                                                                                  [List (con bytestring)]
                                                                                  (lam
                                                                                    ds
                                                                                    [List [[Tuple2 (con bytestring)] Data]]
                                                                                    (lam
                                                                                      ds
                                                                                      (con bytestring)
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              {
                                                                                                fFoldableNil_cfoldMap
                                                                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                              }
                                                                                              TxInInfo
                                                                                            }
                                                                                            fMonoidValue
                                                                                          ]
                                                                                          (lam
                                                                                            x
                                                                                            TxInInfo
                                                                                            [
                                                                                              {
                                                                                                [
                                                                                                  TxInInfo_match
                                                                                                  x
                                                                                                ]
                                                                                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                              }
                                                                                              (lam
                                                                                                ds
                                                                                                TxOutRef
                                                                                                (lam
                                                                                                  ds
                                                                                                  TxOut
                                                                                                  [
                                                                                                    {
                                                                                                      [
                                                                                                        TxOut_match
                                                                                                        ds
                                                                                                      ]
                                                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                    }
                                                                                                    (lam
                                                                                                      ds
                                                                                                      Address
                                                                                                      (lam
                                                                                                        ds
                                                                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                                        (lam
                                                                                                          ds
                                                                                                          [Maybe (con bytestring)]
                                                                                                          ds
                                                                                                        )
                                                                                                      )
                                                                                                    )
                                                                                                  ]
                                                                                                )
                                                                                              )
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        ds
                                                                                      ]
                                                                                    )
                                                                                  )
                                                                                )
                                                                              )
                                                                            )
                                                                          )
                                                                        )
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              ]
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam thunk Unit True)
                                                      ]
                                                      (lam
                                                        thunk
                                                        Unit
                                                        [
                                                          [
                                                            {
                                                              [
                                                                Unit_match
                                                                [
                                                                  trace
                                                                  (con
                                                                    string
                                                                      "Spent value not OK"
                                                                  )
                                                                ]
                                                              ]
                                                              (fun Unit Bool)
                                                            }
                                                            (lam
                                                              thunk Unit False
                                                            )
                                                          ]
                                                          Unit
                                                        ]
                                                      )
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              ]
                                              (lam
                                                txOutRef
                                                TxOutRef
                                                (let
                                                  (nonrec)
                                                  (termbind
                                                    (nonstrict)
                                                    (vardecl j Bool)
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Unit_match
                                                            [
                                                              trace
                                                              (con
                                                                string
                                                                  "Public key output not spent"
                                                              )
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam thunk Unit False)
                                                      ]
                                                      Unit
                                                    ]
                                                  )
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            {
                                                              Maybe_match
                                                              TxInInfo
                                                            }
                                                            [
                                                              [
                                                                findTxInByTxOutRef
                                                                txOutRef
                                                              ]
                                                              ds
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam
                                                          a
                                                          TxInInfo
                                                          (lam
                                                            thunk
                                                            Unit
                                                            [
                                                              {
                                                                [
                                                                  TxInInfo_match
                                                                  a
                                                                ]
                                                                Bool
                                                              }
                                                              (lam
                                                                ds
                                                                TxOutRef
                                                                (lam
                                                                  ds
                                                                  TxOut
                                                                  [
                                                                    {
                                                                      [
                                                                        TxOut_match
                                                                        ds
                                                                      ]
                                                                      Bool
                                                                    }
                                                                    (lam
                                                                      ds
                                                                      Address
                                                                      (lam
                                                                        ds
                                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                        (lam
                                                                          ds
                                                                          [Maybe (con bytestring)]
                                                                          [
                                                                            [
                                                                              [
                                                                                {
                                                                                  [
                                                                                    {
                                                                                      Maybe_match
                                                                                      (con bytestring)
                                                                                    }
                                                                                    ds
                                                                                  ]
                                                                                  (fun Unit Bool)
                                                                                }
                                                                                (lam
                                                                                  ds
                                                                                  (con bytestring)
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    j
                                                                                  )
                                                                                )
                                                                              ]
                                                                              (lam
                                                                                thunk
                                                                                Unit
                                                                                True
                                                                              )
                                                                            ]
                                                                            Unit
                                                                          ]
                                                                        )
                                                                      )
                                                                    )
                                                                  ]
                                                                )
                                                              )
                                                            ]
                                                          )
                                                        )
                                                      ]
                                                      (lam thunk Unit j)
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              )
                                            ]
                                            (lam
                                              txOutRef
                                              TxOutRef
                                              (lam
                                                ds
                                                Data
                                                [
                                                  [
                                                    [
                                                      {
                                                        [
                                                          {
                                                            Maybe_match TxInInfo
                                                          }
                                                          [
                                                            [
                                                              findTxInByTxOutRef
                                                              txOutRef
                                                            ]
                                                            ds
                                                          ]
                                                        ]
                                                        (fun Unit Bool)
                                                      }
                                                      (lam
                                                        ds
                                                        TxInInfo
                                                        (lam thunk Unit True)
                                                      )
                                                    ]
                                                    (lam
                                                      thunk
                                                      Unit
                                                      [
                                                        [
                                                          {
                                                            [
                                                              Unit_match
                                                              [
                                                                trace
                                                                (con
                                                                  string
                                                                    "Script output not spent"
                                                                )
                                                              ]
                                                            ]
                                                            (fun Unit Bool)
                                                          }
                                                          (lam thunk Unit False)
                                                        ]
                                                        Unit
                                                      ]
                                                    )
                                                  ]
                                                  Unit
                                                ]
                                              )
                                            )
                                          ]
                                          (lam
                                            interval
                                            [Interval (con integer)]
                                            [
                                              [
                                                [
                                                  {
                                                    [
                                                      Bool_match
                                                      [
                                                        [
                                                          [
                                                            {
                                                              contains
                                                              (con integer)
                                                            }
                                                            fOrdSlot
                                                          ]
                                                          interval
                                                        ]
                                                        [
                                                          {
                                                            [ TxInfo_match ds ]
                                                            [Interval (con integer)]
                                                          }
                                                          (lam
                                                            ds
                                                            [List TxInInfo]
                                                            (lam
                                                              ds
                                                              [List TxInInfo]
                                                              (lam
                                                                ds
                                                                [List TxOut]
                                                                (lam
                                                                  ds
                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                  (lam
                                                                    ds
                                                                    [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                    (lam
                                                                      ds
                                                                      [List DCert]
                                                                      (lam
                                                                        ds
                                                                        [List [[Tuple2 StakingCredential] (con integer)]]
                                                                        (lam
                                                                          ds
                                                                          [Interval (con integer)]
                                                                          (lam
                                                                            ds
                                                                            [List (con bytestring)]
                                                                            (lam
                                                                              ds
                                                                              [List [[Tuple2 (con bytestring)] Data]]
                                                                              (lam
                                                                                ds
                                                                                (con bytestring)
                                                                                ds
                                                                              )
                                                                            )
                                                                          )
                                                                        )
                                                                      )
                                                                    )
                                                                  )
                                                                )
                                                              )
                                                            )
                                                          )
                                                        ]
                                                      ]
                                                    ]
                                                    (fun Unit Bool)
                                                  }
                                                  (lam thunk Unit True)
                                                ]
                                                (lam
                                                  thunk
                                                  Unit
                                                  [
                                                    [
                                                      {
                                                        [
                                                          Unit_match
                                                          [
                                                            trace
                                                            (con
                                                              string
                                                                "Wrong validation interval"
                                                            )
                                                          ]
                                                        ]
                                                        (fun Unit Bool)
                                                      }
                                                      (lam thunk Unit False)
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              ]
                                              Unit
                                            ]
                                          )
                                        ]
                                      )
                                    )
                                  )
                                ]
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                checkScriptContext
                                (all i (type) (all o (type) (fun [IsData o] (fun [[TxConstraints i] o] (fun ScriptContext Bool)))))
                              )
                              (abs
                                i
                                (type)
                                (abs
                                  o
                                  (type)
                                  (lam
                                    dIsData
                                    [IsData o]
                                    (lam
                                      ds
                                      [[TxConstraints i] o]
                                      (lam
                                        ptx
                                        ScriptContext
                                        [
                                          {
                                            [
                                              { { TxConstraints_match i } o } ds
                                            ]
                                            Bool
                                          }
                                          (lam
                                            ds
                                            [List TxConstraint]
                                            (lam
                                              ds
                                              [List [InputConstraint i]]
                                              (lam
                                                ds
                                                [List [OutputConstraint o]]
                                                (let
                                                  (nonrec)
                                                  (termbind
                                                    (nonstrict)
                                                    (vardecl j Bool)
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Unit_match
                                                            [
                                                              trace
                                                              (con
                                                                string
                                                                  "checkScriptContext failed"
                                                              )
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam thunk Unit False)
                                                      ]
                                                      Unit
                                                    ]
                                                  )
                                                  [
                                                    [
                                                      [
                                                        {
                                                          [
                                                            Bool_match
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    {
                                                                      fFoldableNil_cfoldMap
                                                                      [(lam a (type) a) Bool]
                                                                    }
                                                                    TxConstraint
                                                                  }
                                                                  [
                                                                    {
                                                                      fMonoidProduct
                                                                      Bool
                                                                    }
                                                                    fMultiplicativeMonoidBool
                                                                  ]
                                                                ]
                                                                [
                                                                  checkTxConstraint
                                                                  ptx
                                                                ]
                                                              ]
                                                              ds
                                                            ]
                                                          ]
                                                          (fun Unit Bool)
                                                        }
                                                        (lam
                                                          thunk
                                                          Unit
                                                          [
                                                            [
                                                              [
                                                                {
                                                                  [
                                                                    Bool_match
                                                                    [
                                                                      [
                                                                        [
                                                                          {
                                                                            {
                                                                              fFoldableNil_cfoldMap
                                                                              [(lam a (type) a) Bool]
                                                                            }
                                                                            [InputConstraint i]
                                                                          }
                                                                          [
                                                                            {
                                                                              fMonoidProduct
                                                                              Bool
                                                                            }
                                                                            fMultiplicativeMonoidBool
                                                                          ]
                                                                        ]
                                                                        [
                                                                          {
                                                                            checkOwnInputConstraint
                                                                            i
                                                                          }
                                                                          ptx
                                                                        ]
                                                                      ]
                                                                      ds
                                                                    ]
                                                                  ]
                                                                  (fun Unit Bool)
                                                                }
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    [
                                                                      [
                                                                        {
                                                                          [
                                                                            Bool_match
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    {
                                                                                      fFoldableNil_cfoldMap
                                                                                      [(lam a (type) a) Bool]
                                                                                    }
                                                                                    [OutputConstraint o]
                                                                                  }
                                                                                  [
                                                                                    {
                                                                                      fMonoidProduct
                                                                                      Bool
                                                                                    }
                                                                                    fMultiplicativeMonoidBool
                                                                                  ]
                                                                                ]
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      checkOwnOutputConstraint
                                                                                      o
                                                                                    }
                                                                                    dIsData
                                                                                  ]
                                                                                  ptx
                                                                                ]
                                                                              ]
                                                                              ds
                                                                            ]
                                                                          ]
                                                                          (fun Unit Bool)
                                                                        }
                                                                        (lam
                                                                          thunk
                                                                          Unit
                                                                          True
                                                                        )
                                                                      ]
                                                                      (lam
                                                                        thunk
                                                                        Unit
                                                                        j
                                                                      )
                                                                    ]
                                                                    Unit
                                                                  ]
                                                                )
                                                              ]
                                                              (lam thunk Unit j)
                                                            ]
                                                            Unit
                                                          ]
                                                        )
                                                      ]
                                                      (lam thunk Unit j)
                                                    ]
                                                    Unit
                                                  ]
                                                )
                                              )
                                            )
                                          )
                                        ]
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                isZero
                                (fun [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]] Bool)
                              )
                              (lam
                                ds
                                [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                (let
                                  (rec)
                                  (termbind
                                    (strict)
                                    (vardecl
                                      go
                                      (fun [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]] Bool)
                                    )
                                    (lam
                                      xs
                                      [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                      [
                                        [
                                          [
                                            {
                                              [
                                                {
                                                  Nil_match
                                                  [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                }
                                                xs
                                              ]
                                              (fun Unit Bool)
                                            }
                                            (lam thunk Unit True)
                                          ]
                                          (lam
                                            ds
                                            [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                            (lam
                                              xs
                                              [List [[Tuple2 (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]]
                                              (lam
                                                thunk
                                                Unit
                                                [
                                                  {
                                                    [
                                                      {
                                                        {
                                                          Tuple2_match
                                                          (con bytestring)
                                                        }
                                                        [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                      }
                                                      ds
                                                    ]
                                                    Bool
                                                  }
                                                  (lam
                                                    ds
                                                    (con bytestring)
                                                    (lam
                                                      x
                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]
                                                      (let
                                                        (rec)
                                                        (termbind
                                                          (strict)
                                                          (vardecl
                                                            go
                                                            (fun [List [[Tuple2 (con bytestring)] (con integer)]] Bool)
                                                          )
                                                          (lam
                                                            xs
                                                            [List [[Tuple2 (con bytestring)] (con integer)]]
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      {
                                                                        Nil_match
                                                                        [[Tuple2 (con bytestring)] (con integer)]
                                                                      }
                                                                      xs
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    [ go xs ]
                                                                  )
                                                                ]
                                                                (lam
                                                                  ds
                                                                  [[Tuple2 (con bytestring)] (con integer)]
                                                                  (lam
                                                                    xs
                                                                    [List [[Tuple2 (con bytestring)] (con integer)]]
                                                                    (lam
                                                                      thunk
                                                                      Unit
                                                                      [
                                                                        {
                                                                          [
                                                                            {
                                                                              {
                                                                                Tuple2_match
                                                                                (con bytestring)
                                                                              }
                                                                              (con integer)
                                                                            }
                                                                            ds
                                                                          ]
                                                                          Bool
                                                                        }
                                                                        (lam
                                                                          ds
                                                                          (con bytestring)
                                                                          (lam
                                                                            x
                                                                            (con integer)
                                                                            [
                                                                              [
                                                                                [
                                                                                  {
                                                                                    [
                                                                                      Bool_match
                                                                                      [
                                                                                        [
                                                                                          equalsInteger
                                                                                          (con
                                                                                            integer
                                                                                              0
                                                                                          )
                                                                                        ]
                                                                                        x
                                                                                      ]
                                                                                    ]
                                                                                    (fun Unit Bool)
                                                                                  }
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      go
                                                                                      xs
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  False
                                                                                )
                                                                              ]
                                                                              Unit
                                                                            ]
                                                                          )
                                                                        )
                                                                      ]
                                                                    )
                                                                  )
                                                                )
                                                              ]
                                                              Unit
                                                            ]
                                                          )
                                                        )
                                                        [ go x ]
                                                      )
                                                    )
                                                  )
                                                ]
                                              )
                                            )
                                          )
                                        ]
                                        Unit
                                      ]
                                    )
                                  )
                                  [ go ds ]
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                wmkValidator
                                (all s (type) (all i (type) (fun [IsData s] (fun (fun [State s] (fun i [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State s]]])) (fun (fun s Bool) (fun (fun s (fun i (fun ScriptContext Bool))) (fun s (fun i (fun ScriptContext Bool)))))))))
                              )
                              (abs
                                s
                                (type)
                                (abs
                                  i
                                  (type)
                                  (lam
                                    w
                                    [IsData s]
                                    (lam
                                      ww
                                      (fun [State s] (fun i [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State s]]]))
                                      (lam
                                        ww
                                        (fun s Bool)
                                        (lam
                                          ww
                                          (fun s (fun i (fun ScriptContext Bool)))
                                          (lam
                                            w
                                            s
                                            (lam
                                              w
                                              i
                                              (lam
                                                w
                                                ScriptContext
                                                [
                                                  [
                                                    [
                                                      {
                                                        [
                                                          Bool_match
                                                          [ [ [ ww w ] w ] w ]
                                                        ]
                                                        (fun Unit Bool)
                                                      }
                                                      (lam
                                                        thunk
                                                        Unit
                                                        [
                                                          [
                                                            [
                                                              {
                                                                [
                                                                  {
                                                                    Maybe_match
                                                                    [[Tuple2 [[TxConstraints Void] Void]] [State s]]
                                                                  }
                                                                  [
                                                                    [
                                                                      ww
                                                                      [
                                                                        [
                                                                          {
                                                                            State
                                                                            s
                                                                          }
                                                                          w
                                                                        ]
                                                                        [
                                                                          [
                                                                            [
                                                                              {
                                                                                [
                                                                                  {
                                                                                    Maybe_match
                                                                                    TxInInfo
                                                                                  }
                                                                                  [
                                                                                    findOwnInput
                                                                                    w
                                                                                  ]
                                                                                ]
                                                                                (fun Unit [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]])
                                                                              }
                                                                              (lam
                                                                                a
                                                                                TxInInfo
                                                                                (lam
                                                                                  thunk
                                                                                  Unit
                                                                                  [
                                                                                    {
                                                                                      [
                                                                                        TxInInfo_match
                                                                                        a
                                                                                      ]
                                                                                      [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                    }
                                                                                    (lam
                                                                                      ds
                                                                                      TxOutRef
                                                                                      (lam
                                                                                        ds
                                                                                        TxOut
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              TxOut_match
                                                                                              ds
                                                                                            ]
                                                                                            [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                          }
                                                                                          (lam
                                                                                            ds
                                                                                            Address
                                                                                            (lam
                                                                                              ds
                                                                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                              (lam
                                                                                                ds
                                                                                                [Maybe (con bytestring)]
                                                                                                ds
                                                                                              )
                                                                                            )
                                                                                          )
                                                                                        ]
                                                                                      )
                                                                                    )
                                                                                  ]
                                                                                )
                                                                              )
                                                                            ]
                                                                            (lam
                                                                              thunk
                                                                              Unit
                                                                              [
                                                                                {
                                                                                  error
                                                                                  [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                                }
                                                                                Unit
                                                                              ]
                                                                            )
                                                                          ]
                                                                          Unit
                                                                        ]
                                                                      ]
                                                                    ]
                                                                    w
                                                                  ]
                                                                ]
                                                                (fun Unit Bool)
                                                              }
                                                              (lam
                                                                ds
                                                                [[Tuple2 [[TxConstraints Void] Void]] [State s]]
                                                                (lam
                                                                  thunk
                                                                  Unit
                                                                  [
                                                                    {
                                                                      [
                                                                        {
                                                                          {
                                                                            Tuple2_match
                                                                            [[TxConstraints Void] Void]
                                                                          }
                                                                          [State s]
                                                                        }
                                                                        ds
                                                                      ]
                                                                      Bool
                                                                    }
                                                                    (lam
                                                                      newConstraints
                                                                      [[TxConstraints Void] Void]
                                                                      (lam
                                                                        ds
                                                                        [State s]
                                                                        [
                                                                          {
                                                                            [
                                                                              {
                                                                                State_match
                                                                                s
                                                                              }
                                                                              ds
                                                                            ]
                                                                            Bool
                                                                          }
                                                                          (lam
                                                                            ds
                                                                            s
                                                                            (lam
                                                                              ds
                                                                              [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] [[(lam k (type) (lam v (type) [List [[Tuple2 k] v]])) (con bytestring)] (con integer)]]
                                                                              [
                                                                                [
                                                                                  [
                                                                                    {
                                                                                      [
                                                                                        Bool_match
                                                                                        [
                                                                                          ww
                                                                                          ds
                                                                                        ]
                                                                                      ]
                                                                                      (fun Unit Bool)
                                                                                    }
                                                                                    (lam
                                                                                      thunk
                                                                                      Unit
                                                                                      [
                                                                                        [
                                                                                          [
                                                                                            {
                                                                                              [
                                                                                                Bool_match
                                                                                                [
                                                                                                  isZero
                                                                                                  ds
                                                                                                ]
                                                                                              ]
                                                                                              (fun Unit Bool)
                                                                                            }
                                                                                            (lam
                                                                                              thunk
                                                                                              Unit
                                                                                              [
                                                                                                [
                                                                                                  [
                                                                                                    {
                                                                                                      [
                                                                                                        Bool_match
                                                                                                        [
                                                                                                          [
                                                                                                            [
                                                                                                              {
                                                                                                                {
                                                                                                                  checkScriptContext
                                                                                                                  Void
                                                                                                                }
                                                                                                                Void
                                                                                                              }
                                                                                                              fIsDataVoid
                                                                                                            ]
                                                                                                            newConstraints
                                                                                                          ]
                                                                                                          w
                                                                                                        ]
                                                                                                      ]
                                                                                                      (fun Unit Bool)
                                                                                                    }
                                                                                                    (lam
                                                                                                      thunk
                                                                                                      Unit
                                                                                                      True
                                                                                                    )
                                                                                                  ]
                                                                                                  (lam
                                                                                                    thunk
                                                                                                    Unit
                                                                                                    [
                                                                                                      [
                                                                                                        {
                                                                                                          [
                                                                                                            Unit_match
                                                                                                            [
                                                                                                              trace
                                                                                                              (con
                                                                                                                string
                                                                                                                  "State transition invalid - constraints not satisfied by ScriptContext"
                                                                                                              )
                                                                                                            ]
                                                                                                          ]
                                                                                                          (fun Unit Bool)
                                                                                                        }
                                                                                                        (lam
                                                                                                          thunk
                                                                                                          Unit
                                                                                                          False
                                                                                                        )
                                                                                                      ]
                                                                                                      Unit
                                                                                                    ]
                                                                                                  )
                                                                                                ]
                                                                                                Unit
                                                                                              ]
                                                                                            )
                                                                                          ]
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            [
                                                                                              [
                                                                                                {
                                                                                                  [
                                                                                                    Unit_match
                                                                                                    [
                                                                                                      trace
                                                                                                      (con
                                                                                                        string
                                                                                                          "Non-zero value allocated in final state"
                                                                                                      )
                                                                                                    ]
                                                                                                  ]
                                                                                                  (fun Unit Bool)
                                                                                                }
                                                                                                (lam
                                                                                                  thunk
                                                                                                  Unit
                                                                                                  False
                                                                                                )
                                                                                              ]
                                                                                              Unit
                                                                                            ]
                                                                                          )
                                                                                        ]
                                                                                        Unit
                                                                                      ]
                                                                                    )
                                                                                  ]
                                                                                  (lam
                                                                                    thunk
                                                                                    Unit
                                                                                    [
                                                                                      [
                                                                                        [
                                                                                          {
                                                                                            [
                                                                                              Bool_match
                                                                                              [
                                                                                                [
                                                                                                  [
                                                                                                    {
                                                                                                      {
                                                                                                        checkScriptContext
                                                                                                        Void
                                                                                                      }
                                                                                                      s
                                                                                                    }
                                                                                                    w
                                                                                                  ]
                                                                                                  [
                                                                                                    {
                                                                                                      [
                                                                                                        {
                                                                                                          {
                                                                                                            TxConstraints_match
                                                                                                            Void
                                                                                                          }
                                                                                                          Void
                                                                                                        }
                                                                                                        newConstraints
                                                                                                      ]
                                                                                                      [[TxConstraints Void] s]
                                                                                                    }
                                                                                                    (lam
                                                                                                      ds
                                                                                                      [List TxConstraint]
                                                                                                      (lam
                                                                                                        ds
                                                                                                        [List [InputConstraint Void]]
                                                                                                        (lam
                                                                                                          ds
                                                                                                          [List [OutputConstraint Void]]
                                                                                                          [
                                                                                                            [
                                                                                                              [
                                                                                                                {
                                                                                                                  {
                                                                                                                    TxConstraints
                                                                                                                    Void
                                                                                                                  }
                                                                                                                  s
                                                                                                                }
                                                                                                                ds
                                                                                                              ]
                                                                                                              ds
                                                                                                            ]
                                                                                                            [
                                                                                                              {
                                                                                                                build
                                                                                                                [OutputConstraint s]
                                                                                                              }
                                                                                                              (abs
                                                                                                                a
                                                                                                                (type)
                                                                                                                (lam
                                                                                                                  c
                                                                                                                  (fun [OutputConstraint s] (fun a a))
                                                                                                                  (lam
                                                                                                                    n
                                                                                                                    a
                                                                                                                    [
                                                                                                                      [
                                                                                                                        c
                                                                                                                        [
                                                                                                                          [
                                                                                                                            {
                                                                                                                              OutputConstraint
                                                                                                                              s
                                                                                                                            }
                                                                                                                            ds
                                                                                                                          ]
                                                                                                                          ds
                                                                                                                        ]
                                                                                                                      ]
                                                                                                                      n
                                                                                                                    ]
                                                                                                                  )
                                                                                                                )
                                                                                                              )
                                                                                                            ]
                                                                                                          ]
                                                                                                        )
                                                                                                      )
                                                                                                    )
                                                                                                  ]
                                                                                                ]
                                                                                                w
                                                                                              ]
                                                                                            ]
                                                                                            (fun Unit Bool)
                                                                                          }
                                                                                          (lam
                                                                                            thunk
                                                                                            Unit
                                                                                            True
                                                                                          )
                                                                                        ]
                                                                                        (lam
                                                                                          thunk
                                                                                          Unit
                                                                                          [
                                                                                            [
                                                                                              {
                                                                                                [
                                                                                                  Unit_match
                                                                                                  [
                                                                                                    trace
                                                                                                    (con
                                                                                                      string
                                                                                                        "State transition invalid - constraints not satisfied by ScriptContext"
                                                                                                    )
                                                                                                  ]
                                                                                                ]
                                                                                                (fun Unit Bool)
                                                                                              }
                                                                                              (lam
                                                                                                thunk
                                                                                                Unit
                                                                                                False
                                                                                              )
                                                                                            ]
                                                                                            Unit
                                                                                          ]
                                                                                        )
                                                                                      ]
                                                                                      Unit
                                                                                    ]
                                                                                  )
                                                                                ]
                                                                                Unit
                                                                              ]
                                                                            )
                                                                          )
                                                                        ]
                                                                      )
                                                                    )
                                                                  ]
                                                                )
                                                              )
                                                            ]
                                                            (lam
                                                              thunk
                                                              Unit
                                                              [
                                                                [
                                                                  {
                                                                    [
                                                                      Unit_match
                                                                      [
                                                                        trace
                                                                        (con
                                                                          string
                                                                            "State transition invalid - input is not a valid transition at the current state"
                                                                        )
                                                                      ]
                                                                    ]
                                                                    (fun Unit Bool)
                                                                  }
                                                                  (lam
                                                                    thunk
                                                                    Unit
                                                                    False
                                                                  )
                                                                ]
                                                                Unit
                                                              ]
                                                            )
                                                          ]
                                                          Unit
                                                        ]
                                                      )
                                                    ]
                                                    (lam
                                                      thunk
                                                      Unit
                                                      [
                                                        [
                                                          {
                                                            [
                                                              Unit_match
                                                              [
                                                                trace
                                                                (con
                                                                  string
                                                                    "State transition invalid - checks failed"
                                                                )
                                                              ]
                                                            ]
                                                            (fun Unit Bool)
                                                          }
                                                          (lam thunk Unit False)
                                                        ]
                                                        Unit
                                                      ]
                                                    )
                                                  ]
                                                  Unit
                                                ]
                                              )
                                            )
                                          )
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (strict)
                              (vardecl
                                mkValidator
                                (all s (type) (all i (type) (fun [IsData s] (fun [[StateMachine s] i] (fun s (fun i (fun ScriptContext Bool)))))))
                              )
                              (abs
                                s
                                (type)
                                (abs
                                  i
                                  (type)
                                  (lam
                                    w
                                    [IsData s]
                                    (lam
                                      w
                                      [[StateMachine s] i]
                                      (lam
                                        w
                                        s
                                        (lam
                                          w
                                          i
                                          (lam
                                            w
                                            ScriptContext
                                            [
                                              {
                                                [
                                                  { { StateMachine_match s } i }
                                                  w
                                                ]
                                                Bool
                                              }
                                              (lam
                                                ww
                                                (fun [State s] (fun i [Maybe [[Tuple2 [[TxConstraints Void] Void]] [State s]]]))
                                                (lam
                                                  ww
                                                  (fun s Bool)
                                                  (lam
                                                    ww
                                                    (fun s (fun i (fun ScriptContext Bool)))
                                                    [
                                                      [
                                                        [
                                                          [
                                                            [
                                                              [
                                                                [
                                                                  {
                                                                    {
                                                                      wmkValidator
                                                                      s
                                                                    }
                                                                    i
                                                                  }
                                                                  w
                                                                ]
                                                                ww
                                                              ]
                                                              ww
                                                            ]
                                                            ww
                                                          ]
                                                          w
                                                        ]
                                                        w
                                                      ]
                                                      w
                                                    ]
                                                  )
                                                )
                                              )
                                            ]
                                          )
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                            (termbind
                              (nonstrict)
                              (vardecl
                                mkValidator
                                (fun GameState (fun GameInput (fun ScriptContext Bool)))
                              )
                              [
                                [
                                  { { mkValidator GameState } GameInput }
                                  fIsDataGameState
                                ]
                                machine
                              ]
                            )
                            mkValidator
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)