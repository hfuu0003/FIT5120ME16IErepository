using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;
    public MainPanel MainPanel;
    public SelectMenuPanel SelectMenuPanel;
    public FoodPanel FoodPanel;
    public FoodQuePanel FoodQuePanel;
    private void Awake()
    {
        Instance = this;
    }

    public void OpenSelectMenuPanel()
    {
        SelectMenuPanel.gameObject.SetActive(true);
    }

    public void CloseSelectMenuPanel()
    {
        SelectMenuPanel.gameObject.SetActive(false);
    }

    public void OpenFoodPanel()
    {
        FoodPanel.gameObject.SetActive(true);
    }

    public void CloseFoodPanel()
    {
        FoodPanel.gameObject.SetActive(false);
    }
    public void OpenFoodQuePanel()
    {
        FoodQuePanel.gameObject.SetActive(true);
    }

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
