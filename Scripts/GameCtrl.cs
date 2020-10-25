using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using UnityEngine;

public class GameCtrl : MonoBehaviour
{
    public static GameCtrl Instance;//single instance

    public int currFoodQueIndex = 1;//Which question is currently selected
    private void Awake()
    {
        Instance = this;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
