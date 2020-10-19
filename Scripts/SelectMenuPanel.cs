using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SelectMenuPanel : MonoBehaviour
{
    public List<Button> MenuButtons;

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
                UIManager.Instance.OpenFoodPanel();
                break;
            case 1:
                break;
            case 2:
                break;
        }
    }

    // Update is called once per frame
    void Update()
    {
    }
}