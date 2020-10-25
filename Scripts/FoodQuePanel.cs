using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FoodQuePanel : MonoBehaviour
{
    public List<SelectItem> selectOneQueItems;
    public List<SelectItem> selectTwoQueItems;
    public GameObject errorOneObj;
    public GameObject errorTwoObj;
    public GameObject rightOneObj;
    public GameObject rightTwoObj;

    public GameObject queTwoObj;
    private int currSelectCoun = 0;
    public List<Image> rightOneImages;
    public List<Image> rightTwoImages;
    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < selectOneQueItems.Count; i++)
        {
            SelectItem item = selectOneQueItems[i];
            selectOneQueItems[i].btn.onClick.AddListener(() => { OnClickSelectBtns(item); });
        }
        
        for (int i = 0; i < selectTwoQueItems.Count; i++)
        {
            SelectItem item = selectTwoQueItems[i];
            selectTwoQueItems[i].btn.onClick.AddListener(() => { OnClickSelectTwoBtns(item); });
        }
        queTwoObj.SetActive(false);
    }

    public void InitOneQue()
    {
        for (int i = 0; i < selectOneQueItems.Count; i++)
        {
            selectOneQueItems[i].ReSet();
        }
        for (int i = 0; i < rightOneImages.Count; i++)
        {
            rightOneImages[i].color = new Color(1,1,1,0);
        }

        currSelectCoun = 0;
    }

    public void InitOneTwo()
    {
        for (int i = 0; i < selectTwoQueItems.Count; i++)
        {
            selectTwoQueItems[i].ReSet();
        }
        for (int i = 0; i < rightTwoImages.Count; i++)
        {
            rightTwoImages[i].color = new Color(1,1,1,0);
        }

        currSelectCoun = 0;
    }
    private void OnClickSelectBtns(SelectItem item)
    {
        if (item.isRightSelect)
        {
            if (!item.isSelect )
            {
                item.SetSelect();
                rightOneImages[currSelectCoun].overrideSprite = item.GetSp();
                rightOneImages[currSelectCoun].color = Color.white;
                currSelectCoun++;
                Debug.Log("right");
                if (currSelectCoun >= 4)
                {
                    Debug.Log("pass");
                    rightOneObj.SetActive(true);
                }
            }
        }
        else
        {
            Debug.Log("error");
            errorOneObj.SetActive(true);
        }
    }
    
    private void OnClickSelectTwoBtns(SelectItem item)
    {
        if (item.isRightSelect)
        {
            if (!item.isSelect )
            {
                item.SetSelect();right
                rightTwoImages[currSelectCoun].overrideSprite = item.GetSp();
                rightTwoImages[currSelectCoun].color = Color.white;
                currSelectCoun++;
                Debug.Log("right");
                if (currSelectCoun >= 4)
                {
                    Debug.Log("pass");
                    rightTwoObj.SetActive(true);
                }
            }
        }
        else
        {
            Debug.Log("error");
            errorTwoObj.SetActive(true);
        }
    }

    public void SetNextFoodQue()
    {
        InitOneQue();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
