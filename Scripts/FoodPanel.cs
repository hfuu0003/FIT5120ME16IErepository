using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FoodPanel : MonoBehaviour
{
    ///Menu button
    public List<Button> MenuButtons;
    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < MenuButtons.Count; i++)
        {
            int id = i;
            MenuButtons[i].onClick.AddListener(() => OnClickMenuBtns(id));
        }
    }

    //Click the menu button
    private void OnClickMenuBtns(int id)
    {
        switch (id)
        {
            case 0:
                UIManager.Instance.CloseFoodPanel();//Close FOODPanel
                break;
            case 1:
                UIManager.Instance.OpenFoodQuePanel();//Open the FoodQuePanel panel
                break;
            case 2:
                UIManager.Instance.CloseFoodPanel();//Close FOODPanel
                UIManager.Instance.CloseSelectMenuPanel();//Close selection menu panel
                break;
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
