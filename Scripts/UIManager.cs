using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;//single instance
    public MainPanel MainPanel;//main menu
    public SelectMenuPanel SelectMenuPanel;//Select menu
    public FoodPanel FoodPanel;//Food menu panel
    public FoodQuePanel FoodQuePanel;//Food answer panel
    private void Awake()
    {
        Instance = this;
    }
    //Open the selection menu panel
    public void OpenSelectMenuPanel()
    {
        SelectMenuPanel.gameObject.SetActive(true);
    }
    //Close selection menu panel
    public void CloseSelectMenuPanel()
    {
        SelectMenuPanel.gameObject.SetActive(false);
    }
    //Open the food panel
    public void OpenFoodPanel()
    {
        FoodPanel.gameObject.SetActive(true);
    }
    //Close the food panel
    public void CloseFoodPanel()
    {
        FoodPanel.gameObject.SetActive(false);
    }
    //Open the food answer panel
    public void OpenFoodQuePanel()
    {
        FoodQuePanel.gameObject.SetActive(true);
    }
    //Close the food answer panel
    public void CloseFoodQuePanel()
    {
        FoodQuePanel.gameObject.SetActive(false);
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
