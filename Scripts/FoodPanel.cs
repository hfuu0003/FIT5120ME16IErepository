using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FoodPanel : MonoBehaviour
{
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

    private void OnClickMenuBtns(int id)
    {
        switch (id)
        {
            case 0:
                UIManager.Instance.CloseFoodPanel();
                break;
            case 1:
                UIManager.Instance.OpenFoodQuePanel();
                break;
            case 2:
                UIManager.Instance.CloseFoodPanel();
                UIManager.Instance.CloseSelectMenuPanel();
                break;
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
