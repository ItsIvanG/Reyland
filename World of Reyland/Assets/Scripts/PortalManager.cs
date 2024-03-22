using System.Collections;
using System.Collections.Generic;
using Unity.Burst.CompilerServices;
using UnityEditor;
using UnityEngine;

public class PortalManager : MonoBehaviour
{
    [SerializeField] public GameObject portal1Scene;
    [SerializeField] public GameObject portal2Scene;
    [SerializeField] GameObject PortalPrefab;
    public static PortalManager instance;
    PortalGun PortalGun;
    // Start is called before the first frame update

    private void Awake()
    {
        instance = this;
    }
    void Start()
    {
        PortalGun = FindFirstObjectByType<PortalGun>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            spawnPortal(1);
        } else if (Input.GetMouseButtonDown(1))
        {
            spawnPortal(2);
        }
    }

    public void spawnPortal(int whatPortal)
    {
        if(whatPortal == 1)
        {
            if (portal1Scene != null)
            {
                Destroy(portal1Scene);
            }

            if (PortalGun.hit = Physics2D.Raycast(PortalGun.ray.origin, PortalGun.mouseCursor 
                - (Vector2)PortalGun.Player.transform.position, 200))
            {
                GameObject spawnBlue = Instantiate(PortalPrefab);
                spawnBlue.transform.position = PortalGun.hit.point;
                spawnBlue.transform.rotation = Quaternion.Euler(0,0, PortalGun.hit.normal.y* 90f);
                spawnBlue.GetComponent<PortalBehavior>().whatPortal = 1;
                portal1Scene = spawnBlue;
            }
                
        } else if (whatPortal == 2)
        {
            if (portal2Scene != null)
            {
                Destroy(portal2Scene);
            }

            if (PortalGun.hit = Physics2D.Raycast(PortalGun.ray.origin, PortalGun.mouseCursor - (Vector2)PortalGun.Player.transform.position, 200))
            {
                GameObject spawnOrange = Instantiate(PortalPrefab);
                spawnOrange.transform.position = PortalGun.hit.point;
                spawnOrange.transform.rotation = Quaternion.Euler(0, 0, PortalGun.hit.normal.y * 90f);
                spawnOrange.GetComponent<PortalBehavior>().whatPortal = 2;
                portal2Scene = spawnOrange;
            }
        }
    }

}
